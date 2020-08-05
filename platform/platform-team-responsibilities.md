---
title: Platform Team Responsibilities
parent: Technical Infrastructure
has_children: true
published: true
nav_order: 370
---

# {{ page.title }}

## Terminology

See [Naming Conventions]({% link platform/naming-conventions.md %}).

## Update {% include glossary.html entry="CI" %} Tools

See [Updating CI Tools]({% link platform/updating-ci-tools.md %}).

## Create repositories

- Application Source code. See ['Create a Bitbucket Repository']({% link platform/bitbucket-new-repo.md %}) for details.
- Deployment, via Helm. See CDC Deployment (<https://bitbucket.org/cessda/cessda.cdc.deploy/src/master/>) repository for a working example.
- Reverse Proxy. See CDC Reverse (<https://bitbucket.org/cessda/cessda.cdc.reverse/src/master/>) repository for a working example.
- Test. See CDC Test (<https://bitbucket.org/cessda/cessda.cdc.test/src/master/>) repository for a working example.
- User Guide - generates documentation from Markdown files.
        See CDC Userguide (<https://bitbucket.org/cessda/cessda.cdc.userguide/src/master/>) repository for a working example.

## Create Jenkins jobs

See [Create a New Jenkins Job]({% link platform/jenkins-new-job.md %}).

## Create DNS records

Needed for development, staging and production instances (see [CESSDA naming conventions]({% link platform/naming-conventions.md %})).
Then update the
[Product Endpoint Details](https://docs.google.com/spreadsheets/d/1HNkqfw09SCj2ZLeMLH3sUw2LIYyjP6hUIXbpsrWULMo/edit?usp=sharing) file.

## Create/edit Jenkinsfile for each repository

Provide a basic pipeline to build, test and deploy the component.
See [Building Maven Projects With Jenkins]({% link platform/building-maven-projects-with-jenkins.md %}) for details.

See also [TemplateJenkinsfileForJDK11MavenProjects]({% link platform/template-jenkinsfile-for-jdk11-maven-projects.md %})
and [Adding the Deployment Jenkinsfile]({% link platform/adding-the-deployment-jenkinsfile.md %}).

Work with developers to create test suites to be used by the pipeline.

- Development. Work with developers to create staging builds for user group testing.

- Staging. Work with users and developers to approve production builds.
        See the [Software Releases]({% link software/releases.md %}) proceedure for details.
