# MO Technical Team Responsibilities

## Create repositories

- Source code
- Deployment
- Test
- Reverse Proxy

** need link to more details, inc web hooks, branch permissions (PRs) etc **

[needs updating BitbucketNewRepo](BitbucketNewRepo/)

## Create Jenkins jobs

- Build from source (see [Building Maven Projects with Jenkins](https://bitbucket.org/cessda/cessda.guidelines.platform/wiki/BuildingMavenProjectsWithJenkins))
- Build docker image (see [Building with Docker](https://bitbucket.org/cessda/cessda.guidelines.platform/wiki/BuildingWithDocker))
- Deploy to dev

Add alerts to relevant Jenkins jobs so that committer (and other developers) know when the build is broken or some tests fail.

[JenkinsNewJob needs updating](JenkinsNewJob/)

## Create DNS records

Needed for development, staging and production instances. See [CESSDA naming conventions](https://bitbucket.org/cessda/cessda.guidelines.platform/wiki/CessdaNamingConventions.md).

## Create/edit Jenkinsfile for each repository

A basic pipeline

- OWASP ZAP
- Selenium
- JMeter – Collaborate with developers

See [TemplateJenkinsfileForJDK11MavenProjects](https://bitbucket.org/cessda/cessda.guidelines.platform/wiki/TemplateJenkinsfileForJDK11MavenProjects) 
and [Adding the Deployment Jenkinsfile](https://bitbucket.org/cessda/cessda.guidelines.platform/wiki/BuildingDockerImagesOnJenkins.md).
**[N.B. BuildingDockerImagesOnJenkin needs splitting in to two pages]**

Work with developers to create staging builds for user testing

- Staging 

Work with users and developers to approve production builds

## Update Jenkins version

See [Updating CI Tools](UpdatingCiTools.md)
