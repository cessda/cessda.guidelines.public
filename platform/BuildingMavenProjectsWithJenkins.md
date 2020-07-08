---
title: Building Maven Projects with Jenkins
parent: Technical Infrastructure
nav_order: 355
---

# {{ page.title }}

## Terminology

See [Naming Conventions]({% link platform/NamingConventions.md %}).

## Overview

The de facto build tool for Java Applications is Maven.
A Jenkinsfile is used to automate the build process.

See also [Building Docker Images on Jenkins]({% link platform/BuildingDockerImagesOnJenkins.md %}) for related information.

* The assumption is that Java and Maven are installed on the Jenkins system node.

 Alternatively the Jenkins subordinate container should be configured to run an image which has Java and Maven pre-installed.

## Adding the Build Jenkinsfile

The Jenkinsfile must be added to the root of the repository. This is the only place
that Jenkins will search for the file.
A Jenkinsfile will always start with a pipeline object that encapsulates the entire job.
The first step is to define the agent to use for the build as shown below:

```groovy
pipeline{
    agent any
}
```

This makes it run with the Jenkins subordinate container configured which has
Java and Maven already installed.

The next stage is building and running a Sonar scan on the application.
To scan Maven projects in sonar the `pom.xml` file needs to have this snippet
inserted in the `<properties>` section.

```xml
<sonar-maven-plugin.version>3.6.0.1398</sonar-maven-plugin.version>
```

In the build section of the pom.xml another snippet must be added.
This allows the sonar plugin to be downloaded from Maven Central:

```xml
<plugin>
  <groupId>org.sonarsource.scanner.maven</groupId>
  <artifactId>sonar-maven-plugin</artifactId>
  <version>${sonar-maven-plugin.version}</version>
</plugin>
```

The Jenkinsfile snippet to build and run SonarQube is shown below:

```groovy
stage('Build Project and Run Sonar Scan') {
    steps {
        withSonarQubeEnv('cessda-sonar') {
            withMaven {
                sh 'mvn clean install sonar:sonar'
            }
        }
    }
}
```

We use the `withMaven{}` step which configures a Maven environment to use within
a pipeline job by calling `sh mvn`.
Additionally, Jenkins discovers the generated Maven artefacts, running and publishing JUnit test results and reports.  

The healthScaleFactor parameter is an amplification factor that is applied to test
failures when computing the test result contribution to the build health score.
From the above script, it is set to the default, factor 1.0.
A factor of 1.0 means that 10% of tests failing will score 90% health score.
The factor is persisted with the build results, so changes will only be reflected in new builds.  

The command `sh 'mvn clean install sonar:sonar'` cleans any existing resources,
builds the projects and generates a report that is sent to [SonarQube](https://sonarqube.cessda.eu) dashboard.

The next stage is to read the SonarQube analysis.  

```groovy
stage("Get Sonar Quality Gate") {
    steps {
        timeout(time: 1, unit: 'HOURS') {
            waitForQualityGate abortPipeline: true
            }
        }
    }
}
```

The timeout option specifies maximum time to wait for the response of a service call. We set the parameter to one hour.
The pipeline will be aborted if the Quality Gate fails.
