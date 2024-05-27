---
title: Building Maven Projects with Jenkins
parent: Continuous Integration and Deployment
grand_parent: Technical Infrastructure
nav_order: 3306
---

# {{ page.title }}

## Terminology

See [Naming Conventions]({% link technical-infrastructure/naming-conventions.md %}).

## Overview

CESSDA uses Java to build several of the components that make up our tools and services.
Maven is used to provide dependency management and a build framework for these components.

> See also [Building Docker Images on Jenkins]({% link technical-infrastructure/continuous-integration-and-deployment/building-maven-projects-with-jenkins.md %}) for related information.

Jenkins agents do not provide a JDK or Maven. We recommend using Docker containers to provide a JDK and using
the [Maven Wrapper](https://maven.apache.org/wrapper/index.html) to provide Maven itself.
This document will assume that Docker and the Maven Wrapper are used.

## Adding the Build Jenkinsfile

The Jenkinsfile must be added to the root of the repository.

> See [Adding the Build Jenkinsfile]({% link technical-infrastructure/continuous-integration-and-deployment/building-docker-images-on-jenkins/adding-the-build-jenkinsfile.md %})
> for general information on how a typical Jenkinsfile looks like.

## Configuring the Agent

The first step is to define the agent to use for the build as shown below:

```groovy
pipeline {
    agent {
        docker {
            image 'openjdk:11'
            reuseNode true
        }
    }
}
```

This makes the build run inside a Docker container which has Java already installed.

### Using Eclipse Temurim JDKs

If [Eclipse Temurin](https://hub.docker.com/_/eclipse-temurin) is used as a base image for Maven builds
then `$HOME` needs to be set in the resulting container. Jenkins uses a non-root user to perform builds
and the Temurim images use `/` as `$HOME` by default. This will cause Maven to fail as it will be unable
to write to `/.m2`.

To work around this, set `$HOME` to `$WORKSPACE_TMP` using the following snippet:

```groovy
pipeline {
    environment {
        HOME = "${WORKSPACE_TMP}"
    }
    agent {
        docker {
            image 'eclipse-temurin:21'
            reuseNode true
        }
    }
}
```

## Building the Application

The Jenkinsfile snippet to build and run SonarQube is shown below:

```groovy
stage('Build Project and Run Sonar Scan') {
    steps {
        withMaven {
            sh './mvnw clean verify'
        }
    }
}
```

We use the `withMaven{}` step which configures Maven to use proxies for Maven Central, provides credentials for
publishing to our internal Maven repository, and allows Jenkins to automatically discover and publish JUnit test reports.

The command `sh './mvnw clean verify'` cleans any existing build output, builds the projects,
runs unit and integration tests, and performs any analysis and verification of source code and build output.

## Scanning using SonarQube

To scan Maven projects in SonarQube the `pom.xml` file needs to have this snippet inserted in the `<build>` section.
This allows the SonarQube Scanner plugin to be downloaded from Maven Central:

```xml
<plugin>
  <groupId>org.sonarsource.scanner.maven</groupId>
  <artifactId>sonar-maven-plugin</artifactId>
  <version>plugin-version</version>
</plugin>
```

The command `sh './mvnw sonar:sonar'` generates a report that is sent to the [SonarQube](https://sonarqube.cessda.eu) dashboard.

```groovy
stage('Run SonarQube Scan') {
    steps {
        withSonarQubeEnv('cessda-sonar') {
            withMaven {
                sh './mvnw sonar:sonar'
            }
        }
    }
}
```

The next stage gets the result of the SonarQube analysis.
The timeout option specifies the maximum time to wait for the response of a service call.
The pipeline will be aborted if the Quality Gate fails or if the timeout expires.

```groovy
stage("Get Sonar Quality Gate") {
    steps {
        timeout(time: 1, unit: 'HOURS') {
            waitForQualityGate abortPipeline: true
        }
    }
}
```

These stages are separated so that cases of a failed analysis can be separated from
an analysis failing a quality gate at a glance.
