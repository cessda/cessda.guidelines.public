---
title: The CESSDA Branching Model for Deployments
parent: Continuous Integration and Deployment
grand_parent: Technical Infrastructure
---

# {{ page.title }}

## Terminology

See [Naming Conventions]({% link technical-infrastructure/naming-conventions.md %}).

## Overview

CESSDA uses [Helm]({% link technical-infrastructure/continuous-integration-and-deployment/deployment-with-helm.md %}) to manage deployments,
which allows applications to be modelled as a single entity in Kubernetes.

Deployments in CESSDA are deployed from dedicated repositories,
separating application code from more production specific configuration.

In these deployment repositories a single branch model is used.
This prevents surprising behaviours due to a condition that only exists in one branch,
which was something that caused many bugs and unexpected behaviours.
This also allows changes to be made to integration branches in the same way as changes to applications are made.

## Handling Multiple Environments

Some settings are per-environment (i.e. what cluster to deploy to, the IP address of databases, etc.).
These need to be set in a way that is visible.

Jenkinsfiles use [Groovy](https://groovy-lang.org/) as the programming language to control builds.
There are two models to building pipelines in Jenkinsfiles,
[declarative pipelines](https://www.jenkins.io/doc/book/pipeline/syntax/#declarative-pipeline) and
[scripted pipelines](https://www.jenkins.io/doc/book/pipeline/syntax/#scripted-pipeline).

Declarative pipelines constrain the flexibility of the form of the Jenkinsfile, which forces a common shape for most pipelines increasing readability and understandability.

Sometimes when more complex behaviour is needed scripted pipelines are necessary.
The full scripted pipeline syntax can be used in a declarative pipeline with a `script {}` block.
This isolates code that is dynamic and may have more complex logic and makes it easily findable.
For example, this code snippet selects a different database address depending on the cluster the application is deployed on.

```groovy
stage('Deploy Application') {
    steps {
        script {
            def mysqlAddress
            if (cluster == 'staging-cluster') {
                mysqlAddress = "staging-database.mysql"
            } else {
                mysqlAddress = "development-database.mysql"
            }
            // Rest of the deployment process
        }
    }
}
```

## Branching Model

The branching model is shared with CESSDA applications.
See [deployment pipeline details]({% link technical-infrastructure/continuous-integration-and-deployment/deployment-pipeline.md %}).

`main` is the integration branch, where all changes are deployed from.
Other branches are merged into `main` when the changes are integrated.
Only the main branch is deployed.

![Branching Model Diagram](../../images/branch-diagram.png)
