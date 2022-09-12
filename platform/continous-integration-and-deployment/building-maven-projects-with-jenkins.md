---
title: Building Maven Projects with Jenkins
parent: Continuous Integration and Deployment
grand_parent: Technical Infrastructure
nav_order: 355
---

# {{ page.title }}

## Terminology

See [Naming Conventions]({% link platform/naming-conventions.md %}).

## Overview

The de facto build tool for Java Applications is Maven.
A Jenkinsfile is used to automate the build process.

See also
[Building Docker Images on Jenkins]({% link platform/continous-integration-and-deployment/building-docker-images-on-jenkins/index.md %})
for related information.

The assumption is that Java and Maven are installed on the Jenkins system node.
Alternatively the Jenkins subordinate container should be configured to run an image which has Java and Maven pre-installed.

## Adding the Build Jenkinsfile

The Jenkinsfile must be added to the root of the repository.
This is the only place that Jenkins will search for the file.
A Jenkinsfile will always start with a pipeline object that encapsulates the entire job.
The first step is to define the agent to use for the build as shown below:

```groovy
pipeline {
    agent any
}
```

This makes it run with the Jenkins subordinate container configured which has
Java and Maven already installed.

The next stage is building and running a Sonar scan on the application.
To scan Maven projects in SonarQube the `pom.xml` file needs to have this snippet inserted in the `<build>` section.
This allows the sonar plugin to be downloaded from Maven Central:

```xml
<plugin>
  <groupId>org.sonarsource.scanner.maven</groupId>
  <artifactId>sonar-maven-plugin</artifactId>
  <version>3.6.0.1398</version>
</plugin>
```

The Jenkinsfile snippet to build and run SonarQube is shown below:

```groovy
stage('Build Project and Run Sonar Scan') {
    steps {
        withMaven {
            sh './mvnw clean install'
        }
    }
}
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

We use the `withMaven{}` step which configures Maven to use proxies for Maven Central, as well as credentials for our internal Maven repository.
Additionally, Jenkins discovers JUnit test reports and automatically publishes them.

The command `sh '.\mvnw clean install'` cleans any existing resources and builds the projects.
The command `sh '.\mvnw sonar:sonar'` generates a report that is sent to the [SonarQube](https://sonarqube.cessda.eu) dashboard.

The next stage gets the result of the SonarQube analysis.

```groovy
stage("Get Sonar Quality Gate") {
    steps {
        timeout(time: 1, unit: 'HOURS') {
            waitForQualityGate abortPipeline: true
        }
    }
}
```

The timeout option specifies the maximum time to wait for the response of a service call.
The pipeline will be aborted if the Quality Gate fails or if the timeout expires.
