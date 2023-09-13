---
title: Deployment Workflow
parent: Continuous Integration and Deployment
grand_parent: Technical Infrastructure
nav_order: 3302
---

# {{ page.title }}

## Terminology

See [Naming Conventions]({% link technical-infrastructure/naming-conventions.md %}).

## Overview

The diagram shows the step-by-step process by which application components are deployed on
CESSDA's Technical Infrastructure and the various technologies that are involved.

The process is automated from the time the developer commits source code changes to the time an
instance of the module or  {% include glossary.html entry="(component)" text="component" %} is deployed to the development and staging environments.
However, deployment to the production environment is manually initiated after testing and
sign-off in the staging environment.

[Helm charts]({% link technical-infrastructure/continuous-integration-and-deployment/deployment-with-helm.md %})
are used to orchestrate the deployment of an application's components.

![DataFlow_Diagram](../../images/dataflow-diagram.png)
