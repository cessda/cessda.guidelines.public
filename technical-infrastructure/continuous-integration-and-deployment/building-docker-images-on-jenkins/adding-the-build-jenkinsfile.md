---
title: Adding the Build Jenkinsfile
parent: Building Docker Images on Jenkins
grand_parent: Continuous Integration and Deployment
nav_order: 33071
---

# {{ page.title }}

## Terminology

See [Naming Conventions]({% link technical-infrastructure/naming-conventions.md %}).

## Overview

The Jenkinsfile must be added to the root of the repository. This is the only place that Jenkins will search for the file.
A Jenkinsfile will always start with a pipeline object that encapsulates the entire job. The form is shown here:

```groovy
pipeline {
    ... // All pipeline configuration and steps
}
```

The first block of significance is the environment block which defines any variables that will be used when building the Docker image.
The {% include glossary.html entry="(product)" text="product" %} and the module name are defined here.
The {% include glossary.html entry="(product)" text="product" %} is the overall application
and the module is a specific {% include glossary.html entry="(component)" text="component" %} of the application.

```groovy
environment {
    productName = "mgmt"
    componentName = "coffeepot"
    // The branch name is filtered to remove invalid Docker tag characters
    imageTag = "${env.DOCKER_ARTIFACT_REGISTRY}/${productName}-${componentName}:${env.BRANCH_NAME.toLowerCase().replaceAll('[^a-z0-9\\.\\_\\-]', '-')}-${env.BUILD_NUMBER}"
}
```

The `env.DOCKER_ARTIFACT_REGISTRY` references an environment variable set by Jenkins that points to the Docker registry.
The image tag uniquely identifies each build, and is based off the source branch and build number.
Unique tags are used in production environments to set the deployed {% include glossary.html entry="(component)" text="component" %} version.

The next step is to define the agent that the build will run on. This can be done globally for the entire pipeline, or per stage.
The default agent is specified using the syntax `agent any`.
See the [Example Jenkinsfile]({% link technical-infrastructure/template-jenkinsfile-for-jdk11-maven-projects.md %})
for more variations on how to configure agents.

The stages used to build the {% include glossary.html entry="(component)" text="component" %} are defined next.
For example, for the `coffee-api` the first stage is building the Docker image.
The build of the  {% include glossary.html entry="(component)" text="component" %} has been defined in a Dockerfile.
This build is run with the following command.

```groovy
stage("Build Docker Image") {
    steps {
        echo "Building Docker image using Dockerfile with tag"
        sh "docker build --tag=${imageTag} ."
    }
}
```

A second stage is used to add a tag to the image. Before pushing the Docker image, the `gcloud auth configure-docker`
command must be run to gives Docker permission to push the image to the CESSDA Docker registry.

```groovy
stage('Push Docker image') {
    steps {
        sh "gcloud auth configure-docker ${env.ARTIFACT_REGISTRY_HOST}"
        sh "docker push ${imageTag}"
        sh "gcloud container images add-tag ${imageTag} ${env.DOCKER_ARTIFACT_REGISTRY}/${productName}-${componentName}:latest"
    }
}
```

The `latest` tag is used to mark the latest image that was built. This should not be used directly and where possible an exact version
should be specified. This makes deployments using rolling updates easier and allows easy rollback should issues be encountered.
