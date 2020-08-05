---
title: Adding the Build Jenkinsfile
parent: Building Docker Images on Jenkins
grand_parent: Technical Infrastructure
nav_order: 3601
---

# {{ page.title }}

## Terminology

See [Naming Conventions]({% link platform/naming-conventions.md %}).

## Overview

The Jenkinsfile must be added to the root of the repository. This is the only place that Jenkins will search for the file.
A Jenkinsfile will always start with a pipeline object that encapsulates the entire job. The form is shown here:

```groovy
pipeline{
}
```

The first block of significance is the environment block which defines any variables that will be used when building the Docker image.
The  {% include glossary.html entry="product" %} and the module name are defined here.
The  {% include glossary.html entry="product" %} is the overall application
and the module is a specific {% include glossary.html entry="component" %} of the application.

```groovy
environment
{
    product_name = "mgmt"
    module_name = "coffeepot"
    image_tag = "${docker_repo}/${product_name}-${module_name}:${env.BRANCH_NAME}-${env.BUILD_NUMBER}"
}
```

The image tag uniquely identifies each build.
Unique tags are used in production environments to set the deployed {% include glossary.html entry="component" %} version.

The next step is to define the agent that the build will run on. This can be done globally for the entire pipeline, or per stage.
The default agent is specified using the syntax `agent any`.
See the [Example Jenkinsfile]({% link platform/template-jenkinsfile-for-jdk11-maven-projects.md %})
for more variations on how to configure agents.

The stages used to build the {% include glossary.html entry="component" %} are defined next.
For example, for the coffee-api the first stage is building the Docker image.
The build of the  {% include glossary.html entry="component" %} has been defined in a Dockerfile.
This build is run with the following command.

```groovy
stage("Build Docker Image"){
    steps{
        echo "Building Docker image using Dockerfile with tag"
        sh("docker build --t ${image_tag} .")
    }
}
```

A second stage is used to add a tag to the image. Note the `gcloud auth configure-docker` command, this gives Docker permission
 to push the image to the private docker repo.

```groovy
stage('Push Docker image'){
    steps{
        sh("gcloud auth configure-docker")
        sh("docker push ${image_tag}")
        sh("gcloud container images add-tag ${image_tag} ${docker_repo}/${product_name}-${module_name}:${env.BRANCH_NAME}-latest")
    }
}
```

The `latest` tag is used to mark the latest image that was built. This should not be used directly and where possible an exact version
 should be specified. This makes deployments using rolling updates easier and allows easy rollback should issues be encountered.
