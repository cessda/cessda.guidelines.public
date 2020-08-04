---
title: Platform Team Responsibilities
parent: Technical Infrastructure
has_children: true
published: true
nav_order: 370
---

# {{ page.title }}

## Terminology

See [Naming Conventions]({% link platform/NamingConventions.md %}).

## Update CI Tools

See [Updating CI Tools]({% link platform/UpdatingCiTools.md %}).

## Create repositories

- Application Source code. See ['Create a Bitbucket Repository']({% link platform/BitbucketNewRepo.md %}) for details.
- Deployment, via Helm. See CDC Deployment (cessda.cdc.deployment) repository for a working example.
- Reverse Proxy. See CDC Reverse (cessda.cdc.reverse) repository for a working example.
- Test. See CDC Test (cessda.cdc.test) repository for a working example.
- User Guide - generates documentation from Markdown files.
        See CDC Userguide (cessda.cdc.userguide) repository for a working example.

## Create Jenkins jobs

See [Create a New Jenkins Job]({% link platform/JenkinsNewJob.md %}).

## Create DNS records

Needed for development, staging and production instances (see [CESSDA naming conventions]({% link platform/NamingConventions.md %})).
Then update the
[Product Endpoint Details](https://docs.google.com/spreadsheets/d/1HNkqfw09SCj2ZLeMLH3sUw2LIYyjP6hUIXbpsrWULMo/edit?usp=sharing) file.

## Create/edit Jenkinsfile for each repository

Provide a basic pipeline to build, test and deploy the component.
See [Building Maven Projects With Jenkins]({% link platform/BuildingMavenProjectsWithJenkins.md %}) for details.

See also [TemplateJenkinsfileForJDK11MavenProjects]({% link platform/TemplateJenkinsfileForJDK11MavenProjects.md %})
and [Adding the Deployment Jenkinsfile]({% link platform/AddingTheDeploymentJenkinsfile.md %}).

Work with developers to create test suites to be used by the pipeline.

- Development. Work with developers to create staging builds for user group testing.

- Staging. Work with users and developers to approve production builds.
        See the [Software Releases]({% link software/releases.md %}) proceedure for details.
