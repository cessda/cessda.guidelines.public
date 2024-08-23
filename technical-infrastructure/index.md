---
title: Technical Infrastructure
has_children: true
nav_order: 300
---

# {{ page.title }}

## Overview

This is an introduction to the CESSDA Technical Infrastructure.
It provides both an overview and detail of the various Google Cloud Platform projects that it is composed of,
and the Jenkins pipelines that are used to build, test and deploy components.

### Read First

The [Technical Infrastructure Overview]({% link technical-infrastructure/technical-infrastructure-overview.md %}) is
the starting point for people who are unfamiliar with CESSDA's Technical Infrastructure.

It gives a broad overview of the purpose and composition of the various components and deployment environments,
the deployment process and the responsibilities of developers versus the CESSDA Platform team.
It links to the following pages (which can be read in conjunction with it, or on a standalone basis).

### Follow up Reading

* [GCP Main Project Structure]({% link technical-infrastructure/gcp-main-project-structure.md %}) - top down
  decomposition of the CESSDA Development and CESSDA Production GCP projects.
* [Deployment Pipeline Details]({% link technical-infrastructure/continuous-integration-and-deployment/deployment-pipeline.md %}) -
  shows the step-by-step process by which application components are deployed and the various technologies that are involved.
  [Helm charts]({% link technical-infrastructure/continuous-integration-and-deployment/deployment-with-helm.md %})
  are used to orchestrate the deployment of an application's components.
* [Deployment Pipeline]({% link technical-infrastructure/continuous-integration-and-deployment/deployment-pipeline.md %}) -
  a step by step explanation of the build and deployment processes.
* [Deploying Core Products]({% link technical-infrastructure/deploying-core-products.md %}) - explains the responsibilities of various
  Actors in order to get a new release deployed.
* [Repository Types]({% link technical-infrastructure/repository-types.md %}) - shows the different types of repositories used within the infrastructure, their naming conventions and their contents
* [Jenkinsfile Template]({% link technical-infrastructure/template-jenkinsfile.md %}) - This shows the general form of a Jenkinsfile used
  to build a component.
