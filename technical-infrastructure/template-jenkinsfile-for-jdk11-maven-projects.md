---
title: Jenkinsfile Template for JDK11 Maven Projects
parent: Technical Infrastructure
nav_order: 385
---

# {{ page.title }}

## Terminology

See [Naming Conventions]({% link technical-infrastructure/naming-conventions.md %}).

## Overview

This shows an example of a Jenkinsfile that could be used with a Maven project based on JDK11.

CESSDA uses Jenkins’ Declarative Pipelines feature to form the logic of the builds. See <https://jenkins.io/doc/book/pipeline/syntax/> for more information on the syntax of Declarative pipelines.

### The `environment` Block

The `environment` block defines environment variables that will be referenced in multiple stages of the build.
These include the name of the component of the product being compiled as well as the name of the product itself.

A Docker image tag is derived from the product and component names. This is combined with `${env.DOCKER_ARTIFACT_REGISTRY}`, a global variable set by the build environment, and `${env.BUILD_NUMBER}` to create the final image name for this build.

```groovy
environment {
    product_name = "product"
    component_name = "module"
    image_tag = "${env.DOCKER_ARTIFACT_REGISTRY}/${product_name}-${component_name}:${env.BUILD_NUMBER}"
}
```

### The `agent` Block

The `agent` block specifies the Jenkins agent to use to perform the build. Most builds will use the standard agent, which can be selected using `agent any`.

```groovy
agent any
```

If a build needs more than 500MB of memory, an agent with 6GB of memory can be provisioned by requesting an agent with the label `jnlp-himem`.

```groovy
agent {
    label 'jnlp-himem'
}
```

### The `stage` Blocks

The `stage` blocks contain the steps needed to compile and test the application. Each stage can specify its own agent, in this case the "Build Project" stage is requesting that the build run in a `openjdk:11-jdk` Docker container.

The `agent` block specifies `reuseNode`, a setting that tells Jenkins not to provision a new JNLP agent (and thus a clean workspace) for this stage. If `reuseNode` is not set, or is set to `false`, then the results of the build will not be available to future stages.

#### The "Build Project" Stage

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

#### Static Analysis Stages

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

#### Build Docker Image Stage

Build the Docker image, push it to the image registry and tag the image as the latest version

```groovy
stage('Build and Push Docker image') {
    steps {
        // Authenticate against the Docker registry
        sh "gcloud auth configure-docker ${env.ARTIFACT_REGISTRY_HOST}"
        withMaven { sh "./mvnw jib:build -Dimage=${image_tag}" }
        sh "gcloud artifacts docker tags add ${image_tag} ${env.DOCKER_ARTIFACT_REGISTRY}/${product_name}-${component_name}:latest"
    }
    when { branch 'main' }
}
```

#### Downstream Deployment Stage

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
