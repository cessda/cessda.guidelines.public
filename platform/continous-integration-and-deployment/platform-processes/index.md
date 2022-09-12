---
title: Platform Processes
parent: Continuous Integration and Deployment
grand_parent: Technical Infrastructure
has_children: true
published: true
nav_order: 3270
---

# {{ page.title }}

## Terminology

See [Naming Conventions]({% link platform/naming-conventions.md %}).

## Update {% include glossary.html entry="CI" text="CI" %} Tools

See [Updating CI Tools]({% link platform/updating-ci-tools.md %}).

## Create repositories

- {% include glossary.html entry="(application code)" text="application code" %}. See
  ['Create a Bitbucket Repository']({% link platform/continous-integration-and-deployment/platform-processes/bitbucket-new-repo.md %}) for details.

- Deployment, via Helm.
        See CDC Deployment (<https://bitbucket.org/cessda/cessda.cdc.deploy/src/master/>) repository for a working example.

- Reverse Proxy.
        See CDC Reverse (<https://bitbucket.org/cessda/cessda.cdc.reverse/src/master/>) repository for a working example.

- Test.
        See CDC Test (<https://bitbucket.org/cessda/cessda.cdc.test/src/master/>) repository for a working example.

- User Guide - generates documentation from Markdown files.
        See CDC Userguide (<https://bitbucket.org/cessda/cessda.cdc.userguide/src/master/>) repository for a working example.

## Create Jenkins jobs

A Jenkins jobs is needed to run the build, test and deployment pipeline.
See [Create a New Jenkins Job]({% link platform/continous-integration-and-deployment/platform-processes/jenkins-new-job.md %}).
If there is a database component, then jobs are needed to backup and restore the database contents
as well as deploying a specified version of the database schema.

## Create DNS records

Needed for development, staging and production instances (see [CESSDA naming conventions]({% link platform/naming-conventions.md %})).
Then update the
[Product Endpoint Details](https://docs.google.com/spreadsheets/d/1HNkqfw09SCj2ZLeMLH3sUw2LIYyjP6hUIXbpsrWULMo/edit?usp=sharing) file.

## Create/edit Jenkinsfile for each repository

Provide a basic pipeline to build, test and deploy the component.
See [Building Maven Projects With Jenkins]({% link platform/continous-integration-and-deployment/building-maven-projects-with-jenkins.md %})
for details.

See also [TemplateJenkinsfileForJDK11MavenProjects]({% link platform/template-jenkinsfile-for-jdk11-maven-projects.md %}) and
[Adding the Deployment Jenkinsfile]({% link platform/continous-integration-and-deployment/building-docker-images-on-jenkins/adding-the-deployment-jenkinsfile.md %}).

Work with developers to create test suites to be used by the pipeline.

- Development. Work with developers to create staging builds for user group testing.
        If relevant, ensure the job for deploying a specified version of the database schema runs successfully.

- Staging. Work with users and developers to approve production builds.
        See the [Software Releases]({% link software/releases.md %}) proceedure for details.

- Production. If relevant, ensure the database backup and restore jobs run successfully.
