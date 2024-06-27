---
title: Creating a Test Suite
parent: Platform Processes
grand_parent: Continuous Integration and Deployment
published: true
---

# {{ page.title }}

## Terminology

See [Naming Conventions]({% link technical-infrastructure/naming-conventions.md %}).

## Overview

The standard CESSDA {% include glossary.html entry="(product)" text="product" %} test suite is made up of:

- [Selenium testing](https://www.selenium.dev/)
- [SonarQube quality gate](https://www.sonarsource.com/products/sonarqube/)

The tests are performed as part of the build process. If the tests pass, the Docker image is created and pushed to the Docker image registry.

## Software testing Pipeline

![Testing Suite Pipeline](../../../images/testing-suite-pipeline.png)

### Testing Suite Jenkinsfile template (`cessda.product.test`)

See [Template Jenkinsfile]({% link technical-infrastructure/template-jenkinsfile.md %}) or
[Template Jenkinsfile for JDK11 Maven projects]({% link technical-infrastructure/template-jenkinsfile-for-jdk11-maven-projects.md %})
