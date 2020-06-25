---
title: Adding the Build Jenkinsfile
layout: page
parent: Technical Infrastructure
nav_order: 310
---

# Adding the Jenkinsfile used to build the component

The Jenkinsfile must be added to the root of the repository. This is the only place that Jenkins will search for the file.
A Jenkinsfile will always start with a pipeline object that encapsulates the entire job. The form is shown here:

```groovy
pipeline{
}
```

The first bock of significance is the environment block which defines any variables that will be used when building the Docker image.
Defined here is the product and the module name. The product is the overall application and the module is the specific component of the
 application.

```groovy
environment
{
    product_name = "mgmt"
    module_name = "coffeepot"
    image_tag = "${docker_repo}/${product_name}-${module_name}:${env.BRANCH_NAME}-${env.BUILD_NUMBER}"
}
```

The image tag uniquely identifies each build. Unique tags are used in production environments to fix the deployed application version.

The next step is to define the agent that the build will run on. This can be done globally for the entire pipeline, or per stage. We will
 define the default agent using the syntax `agent any`.
 See the [Example Jenkinsfile]({% link docs/platform/TemplateJenkinsfileForJDK11MavenProjects.md %})
  for more variations on how to configure agents.

We can now define the stages to build the application. For example, for the coffee-api the first stage is building the Docker image.
 The build of the application has been defined in a Dockerfile. This build is run with the following command.

```groovy
stage("Build Docker Image"){
    steps{
        echo "Building Docker image using Dockerfile with tag"
        sh("docker build --t ${image_tag} .")
    }
}
```

A second stage is used to add the latest tag to the image. Note the gcloud auth configure-docker command, this gives docker permission
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

The latest tag is used to mark the latest image that was built. This should not be used directly and where possible an exact version
 should be specified. This makes deployments using rolling updates easier and allows easy rollback should issues be encountered.
