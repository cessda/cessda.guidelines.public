---
title: Adding the Deployment Jenkinsfile
parent: Building Docker Images on Jenkins
grand_parent: Continuous Integration and Deployment
---

# {{ page.title }}

## Terminology

See [Naming Conventions]({% link technical-infrastructure/naming-conventions.md %}).

## Overview

The  {% include glossary.html entry="(component)" text="component" %} deployment code is stored in a different repository to the build code.
The Jenkinsfile takes the image tag as a string parameter so an exact version of the application can be deployed (for example, a specific version for production).
This parameter can be manually specified by the user or provided automatically by calling jobs.

```groovy
parameters {
    string(name: 'imageTag', defaultValue: 'latest', description: 'The version of the application to deploy, default is latest if unspecified')
}
```

If the Helm chart has external dependencies, these must be updated from the source Helm repositories before the deployment starts. This can be done with the following stage.

```groovy
stage('Update Dependencies') {
    steps {
        sh 'helm dependency update .'
    }
}
```

This stage deploys the application with the image tag specified in the job parameters. See <https://helm.sh/docs/helm/helm_upgrade/> for an explanation of the parameters used.

```groovy
stage('Create deployment') {
    steps {
        echo 'Run Coffeepot Creation Deployment'
        echo "Using image tag ${imageTag}"
        sh "helm upgrade ${productName} . --namespace=${productName} --create-namespace --install --atomic --set image.tag=${imageTag}"
    }
}
```

Helm deploys the component with the name `${productName}` to the namespace `${productName}` using the image tag `${imageTag}`.
See [the Helm documentation](https://helm.sh/docs/) and
[using Helm to deploy products]({% link technical-infrastructure/continuous-integration-and-deployment/deployment-with-helm.md %})
for more information.
