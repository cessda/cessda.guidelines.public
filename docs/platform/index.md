---
title: Technical Infrastructure
has_children: true
nav_order: 300
---

# {{ page.title }}

## Overview

This is an introduction to the CESSDA Technical Infrastructure. It provides both an overview and
 detail of the various Google Cloud Platform projects that it is composed of, and the Jenkins
  pipeline that is used to build, test and deploy components.

### Read First

[Naming Conventions]({% link docs/platform/NamingConventions.md %}). - abbreviations and terminology used in this Wiki. Useful background information.

[Technical Infrastructure Overview]({% link docs/platform/TechnicalInfrastructureOverview.md %}) - is the starting point
 for people who are unfamiliar with CESSDA's Technical Infrastructure. It gives a broad overview
  of the purpose and composition of the various components and deployment environments, the
   deployment process and the responsibilities of developers vs. the CESSDA MO technical team.
    It links to the following pages (which can be read in conjunction with it, or on a standalone basis).

### Follow up Reading

[GCP Main Project Structure]({% link docs/platform/GcpMainProjectStructure.md %}) - top down
 decomposition of the CESSDA Development and CESSDA Production GCP projects.

[Deployment Pipeline Overview]({% link docs/platform/DeploymentPipelineOverview.md %}) - shows the deployment pipeline from
 the moment a developer commits code changes to the deployment of the product to production.

[Deployment Workflow]({% link docs/platform/DeploymentWorkFlow.md %}) - shows the step-by-step process by which application
 components are deployed and the various technologies that are involved. [Helm charts]
 (DeployWithHelm.md %}) are used to orchestrate the deployment of an application's components.

[Deployment Pipeline Details]({% link docs/platform/DeploymentPipelineDetails.md %}) - a step by step explanation of the
 build and deployment processes.

[Deploying Core Products]({% link docs/platform/DeployingCoreProducts.md %}) - explains the responsibilities of various
 Actors in order to get a new release deployed.

[Technical Infrastructure Details]({% link docs/platform/TechnicalInfrastructureDetails.md %}) - shows a general overview
 of the GCP projects, Jenkins CI/CD toolchain and Bitbucket code repositories and how they are
  integrated within the deployment pipeline.

[Jenkinsfile Template]({% link docs/platform/TemplateJenkinsfile.md %}) - This shows the general form of a Jenkinsfile used
 with a non-Maven project.

[Jenkinsfile Template for JDK11 Maven Projects]({% link docs/platform/TemplateJenkinsfileForJDK11MavenProjects.md %}) -
 shows the general form of a Jenkinsfile used with a Maven project based on JDK11.
