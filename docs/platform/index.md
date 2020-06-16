---
title: Platform
layout: page
has_children: true
nav_order: 300
---

# CESSDA Technical Infrastructure

## Overview

This is an introduction to the CESSDA Technical Infrastructure. It provides both an overview and
 detail of the various Google Cloud Platform projects that it is composed of, and the Jenkins
  pipeline that is used to build, test and deploy components.

### Read First

[Naming Conventions](NamingConventions.md) - abbreviations and terminology used in this Wiki. Useful background information.

[Technical Infrastructure Overview](TechnicalInfrastructureOverview.md) - is the starting point
 for people who are unfamiliar with CESSDA's Technical Infrastructure. It gives a broad overview
  of the purpose and composition of the various components and deployment environments, the
   deployment process and the responsibilities of developers vs. the CESSDA MO technical team.
    It links to the following pages (which can be read in conjunction with it, or on a standalone basis).

### Follow up Reading

[GCP Main Project Structure](GcpMainProjectStructure.md) - top down decomposition of the CESSDA Development and CESSDA Production GCP projects.

[Deployment Pipeline Overview](DeploymentPipelineOverview.md) - shows the deployment pipeline from
 the moment a developer commits code changes to the deployment of the product to production.

[Deployment Workflow](DeploymentWorkFlow.md) - shows the step-by-step process by which application
 components are deployed and the various technologies that are involved. [Helm charts]
 (DeployWithHelm.md) are used to orchestrate the deployment of an application's components.

[Deployment Pipeline Details](DeploymentPipelineDetails.md) - a step by step explanation of the
 build and deployment processes.

[Deploying Core Products](DeployingCoreProducts.md) - explains the responsibilities of various
 Actors in order to get a new release deployed.

[Technical Infrastructure Details](TechnicalInfrastructureDetails.md) - shows a general overview
 of the GCP projects, Jenkins CI/CD toolchain and Bitbucket code repositories and how they are
  integrated within the deployment pipeline.

[Jenkinsfile Template](TemplateJenkinsfile.md) - This shows the general form of a Jenkinsfile used
 with a non-Maven project.

[Jenkinsfile Template for JDK11 Maven Projects](TemplateJenkinsfileForJDK11MavenProjects.md) -
 shows the general form of a Jenkinsfile used with a Maven project based on JDK11.
