---
title: Jenkinsfile Template for JDK11 Maven Projects
parent: Technical Infrastructure
nav_order: 385
---

# {{ page.title }}

## Terminology

See [Naming Conventions]({% link technical-infrastructure/naming-conventions.md %}).

## Overview

This shows the general form of a Jenkinsfile used with a Maven project based on JDK11.

The `environment` block defines environment variables that will be referenced in multiple stages of the build.
These include the name of the product and the module, and a Docker image tag.
The `${env.DOCKER_ARTIFACT_REGISTRY}` variable refers to the CESSDA Docker repository and is set by the build environment.

```groovy
environment {
    product_name = "product"
    module_name = "module"
    image_tag = "${env.DOCKER_ARTIFACT_REGISTRY}/${product_name}-${module_name}:${env.BUILD_NUMBER}"
}
```

Specify the Jenkins agent to use to perform the build. Most builds will use the standard agent.

```groovy
agent any
```

If a build needs more than 500MB of memory, an agent with 6GB of memory can be provisioned.

```groovy
agent {
    label 'jnlp-himem'
}
```

Steps to compile and test the application. This is performed in a Docker container that has JDK 11 installed.
The `reuseNode` option tells Jenkins not to provision a new workspace for the build.
If `reuseNode` is not set, or is set to `false`, then the results of the build will not be available to future stages.

```groovy
stage('Build Project') {
    agent {
        docker {
            image 'openjdk:11-jdk'
            reuseNode true
        }
    }
    steps {
        withMaven {
            sh './mvnw clean verify'
        }
    }
}
// Record warnings issued by the Java compiler
stage('Record Issues') {
    steps {
        recordIssues aggregatingResults: true, tools: [java()]
    }
}
```

Run a SonarQube scan and fail the build if the Quality Gate is not passed

```groovy
stage('Run Sonar Scan') {
    agent {
        docker {
            image 'openjdk:11-jdk'
            reuseNode true
        }
    }
    steps {
        withSonarQubeEnv('cessda-sonar') {
            withMaven {
                sh './mvnw sonar:sonar'
            }
        }
        timeout(time: 1, unit: 'HOURS') {
            waitForQualityGate abortPipeline: true
        }
    }
    when { branch 'main' }
}
```

Build the Docker image, push it to the image registry and tag the image as the latest version

```groovy
stage('Build and Push Docker image') {
    steps {
        // Authenticate against the Docker registry
        sh "gcloud auth configure-docker ${env.ARTIFACT_REGISTRY_HOST}"
        withMaven { sh "./mvnw jib:build -Dimage=${image_tag}" }
        sh "gcloud artifacts docker tags add ${image_tag} ${env.DOCKER_ARTIFACT_REGISTRY}/${product_name}-${module_name}:latest"
    }
    when { branch 'main' }
}
```

Start any downstream deployment jobs

```groovy
stage('Check Requirements and Deployments') {
    steps {
        build job: 'cessda.cdc.deploy/main', parameters: [
            string(name: 'osmh_indexer_image_tag', value: "${env.BRANCH_NAME}-${env.BUILD_NUMBER}")
        ], wait: false
    }
    when { branch 'main' }
}
```
