---
title: Deployment Workflow
layout: page
parent: Platform
nav_order: 305
---

# Deployment Workflow

## Terminology

See [Naming Conventions](NamingConventions.md).

## Overview

The diagram shows the step-by-step process by which application components are deployed on CESSDA's Technical Infrastructure and the various technologies that are involved.

The process is automated from the time the developer commits source code changes to the time an instance of the module or component is deployed to the development and staging environments. However, deployment to the production environment is manually initiated after testing and sign-off in the staging environment.

[Helm charts](DeployWithHelm.md) are used to orchestrate the deployment of an application's components.

![DataFlow_Diagram](images/DataFlow_Diagram.png)

For a better view [download](images/DataFlow_Diagram.png) the file.

For editable view of the image, see [Deployment_workflow](https://app.diagrams.net/#G1v2HZyK_hI4BqANju7SAgUy140cPqrsmV) 
