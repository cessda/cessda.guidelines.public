---
title: Platform Processes
parent: Continuous Integration and Deployment
grand_parent: Technical Infrastructure
has_children: true
published: true
nav_order: 370
---

# {{ page.title }}

## Terminology

See [Naming Conventions]({% link technical-infrastructure/naming-conventions.md %}).

## Update {% include glossary.html entry="CI" text="CI" %} Tools

See [Updating CI Tools]({% link technical-infrastructure/continuous-integration-and-deployment/platform-processes/updating-ci-tools.md %}).

## Create repositories

- {% include glossary.html entry="(application code)" text="application code" %}.
        See ['Create a GitHub Repository']({% link technical-infrastructure/continuous-integration-and-deployment/platform-processes/github-new-repo.md %})
        for details.
- Deployment, via Helm.
  - See the CDC Deployment (`cessda/cessda.cdc.deploy` - private) repository for a working example.
- Reverse Proxy.
  - See the CDC Reverse (`cessda/cessda.cdc.reverse` - private) repository for a working example.
- Test.
  - See the CDC Test (`cessda/cessda.cdc.test` - private) repository for a working example.
- User Guide - generates documentation from Markdown files.
  - See the CDC User Guide (<https://github.com/cessda/cessda.cdc.userguide/>) repository for a working example.

## Create Jenkins jobs

A Jenkins jobs is needed to run the build, test and deployment pipeline.
If there is a database component, then jobs are needed to backup and restore the database contents
as well as deploying a specified version of the database schema.
See [Create a New Jenkins Job]({% link technical-infrastructure/continuous-integration-and-deployment/platform-processes/jenkins-new-job.md %}).

## Create DNS records

Needed for development, staging and production instances
(see [CESSDA naming conventions]({% link technical-infrastructure/naming-conventions.md %})).
Then update the
[Product Endpoint Details](https://docs.google.com/spreadsheets/d/1HNkqfw09SCj2ZLeMLH3sUw2LIYyjP6hUIXbpsrWULMo/edit?usp=sharing) file.

## Create/edit Jenkinsfile for each repository

Provide a basic pipeline to build, test and deploy the component.
See [Building Maven Projects With Jenkins]({% link technical-infrastructure/continuous-integration-and-deployment/building-maven-projects-with-jenkins.md %})
for details.

See also [TemplateJenkinsfileForJDK11MavenProjects]({% link technical-infrastructure/template-jenkinsfile-for-jdk11-maven-projects.md %})
and [Adding the Deployment Jenkinsfile]({% link technical-infrastructure/continuous-integration-and-deployment/building-docker-images-on-jenkins/adding-the-deployment-jenkinsfile.md %}).

Work with developers to create test suites to be used by the pipeline.

- Development. Work with developers to create staging builds for user group testing.
        If relevant, ensure the job for deploying a specified version of the database schema runs successfully.
- Staging. Work with users and developers to approve production builds.
        See the [Software Releases]({% link software/releases.md %}) procedure for details.
- Production. If relevant, ensure the database backup and restore jobs run successfully.
