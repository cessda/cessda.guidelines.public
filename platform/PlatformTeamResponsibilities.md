---
title: Platform Team Responsibilities
parent: Technical Infrastructure
published: false
nav_order: 370
---

# {{ page.title }}

## Terminology

See [Naming Conventions]({% link platform/NamingConventions.md %}).

## Create repositories

- Source code
- Deployment
- Test
- Reverse Proxy

** need link to more details, inc web hooks, branch permissions (PRs) etc **

[N.B. needs updating BitbucketNewRepo](BitbucketNewRepo/)

## Create Jenkins jobs

- Build from source (see [Building Maven Projects with Jenkins]({% link platform/BuildingMavenProjectsWithJenkins.md %}))
- Build docker image (see [Building with Docker]({% link platform/BuildingWithDocker.md %}))
- Deploy to dev

Add alerts to relevant Jenkins jobs so that committer (and other developers) know when the build is broken or some tests fail.

[N.B. JenkinsNewJob needs updating](JenkinsNewJob/)

## Create DNS records

Needed for development, staging and production instances (see [CESSDA naming conventions]({% link platform/NamingConventions.md %})).

## Create/edit Jenkinsfile for each repository

A basic pipeline

- OWASP ZAP
- Selenium
- JMeter – Collaborate with developers

See [TemplateJenkinsfileForJDK11MavenProjects]({% link platform/TemplateJenkinsfileForJDK11MavenProjects.md %})
and [Adding the Deployment Jenkinsfile]({% link platform/AddingTheDeploymentJenkinsfile.md %}).

Work with developers to create staging builds for user testing

- Staging

Work with users and developers to approve production builds

## Update Jenkins version

See [Updating CI Tools]({% link platform/UpdatingCiTools.md %}).
