---
title: Creating a Test Suite
parent: Platform Team Responsibilities
grand_parent: Technical Infrastructure
published: true
nav_order: 3704
---

# {{ page.title }}

## Terminology

See [Naming Conventions]({% link platform/naming-conventions.md %}).

## Overview

The standard CESSDA  {% include glossary.html entry="(product)" text="product" %} test suite is made up of:

- [Selenium testing](https://bitbucket.org/cessda/cessda.mgmt.selenium/src/master/)

- [Jmeter testing](https://bitbucket.org/cessda/cessda.mgmt.jmeter/src/master/). See the README file for more details.

- [SonarQube quality gate](https://bitbucket.org/cessda/cessda.mgmt.sonar/src/master/)

The tests are performed as part of the build process. If the tests pass, the Docker image is created and pushed to the Docker image registry.

- [ShiftLeft SAST scan](https://www.shiftleft.io/scan/)

The Static Analysis (SAST) scan runs against the newly built Docker image.
The results are shown in the Jenkins job console output (see example below):

![Shiftleft Scan Results](../images/shiftleft-scan-results.png)

## Software testing Pipeline  

![Testing Suite Pipeline](../images/testing-suite-pipeline.png)

### Testing Suite Jenkinsfile template (cessda.product.test)

See [Template Jenkinsfile]({% link platform/template-jenkinsfile.md %}) or
[Template Jenkinsfile for JDK11 Maven projects]({% link platform/template-jenkinsfile-for-jdk11-maven-projects.md %})
