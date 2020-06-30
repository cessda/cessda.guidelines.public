---
title: Building with Docker
parent: Technical Infrastructure
nav_order: 314
---

# {{ page.title }}

## Terminology

See [Naming Conventions]({% link platform/NamingConventions.md %}).

## Overview

Docker is a container framework used to host a large collection of tools. Jenkins offers Docker integration so that tools can be
 used in a pipeline as if they were natively installed.

## Creating a Step Using Docker

Docker containers are generally used on a per step basis. This is because typically we use the container to either build
 or test our application whilst still using the base JNLP image to create docker images or creating deployments.

To use a docker image in a step we use an agent block to define the container. This is done at the start of the stage block:

```groovy
stage('Build Application'){
    agent{
        docker {
            image '${docker_image}'
            reuseNode true
        }
    }
    steps {
        echo 'Steps go here'
    }
}
```

The `${docker_image}` is replaced by an image tag such as `maven:3-jdk-11` if we wanted to build a JDK 11 application.
 All future steps in the stage are run in the context of the docker container. Note that `reuseNode true` MUST be set or all
  steps in this stage will be run in a different workspace.

### Special Notes for Maven

When running Maven in Docker an additional command must be added so that the right Maven is run:

```groovy
stage('Build Project and start Sonar scan') {
    agent {
        docker {
            image 'maven:3-jdk-11'
            reuseNode true
        }
    }
    steps {
        withSonarQubeEnv('cessda-sonar') {
            withMaven {
                sh 'export PATH=$MVN_CMD_DIR:$PATH && mvn clean install sonar:sonar'
            }
        }
    }
}
```
