---
title: Standard Git Repository Contents
parent: Platform Team Responsibilities
grand_parent: Technical Infrastructure
published: true
nav_order: 3702
---

# {{ page.title }}

## Terminology

See [Naming Conventions]({% link platform/naming-conventions.md %}).

## Overview

Unless otherwise stated, see [Software requirements]({% link software/requirements.md %})
for links to examples of good practice for the following files,
and/or the [CDC Indexer](https://bitbucket.org/cessda/cessda.cdc.osmh-indexer.cmm/src/) repository.

### .gitignore

The `.gitignore` should be populated with file that are not needed in the repository, such as log files, databases, executable,
results from compilation, reports from test frameworks, cached files etc.

Here are several [`.gitignore` templates](https://github.com/github/gitignore) hosted on GitHub.
The `.gitignore` templates should be customised for any application specific paths, such as secrets and build directoryies.

### CHANGELOG.md

A categorised list of all the changes made for each release.

### CODE_OF_CONDUCT.md

Basic do's and don'ts for code contributors.

### CONTRIBUTORS.md

The file should list all the persons involved into the development of the project.
A primary technical contact should be provided in case of questions from CESSDA Main Office staff.

### Dockerfile

Used to build the Docker container.
Either provide a template for the development team to customise, or create a working one for them.

### Jenkinsfile

Defines the build, test and deploy pipeline.
Either provide a template for the development team to customise, or create a working one for them.

### LICENSE.txt

Unless otherwise agreed, CESSDA source code is made available under the Apache 2 License.
A LICENSE file must be present in the repository root that includes the full license text.

### README.md

The README file should be completed by Developers.
Provide a template for the development team to customise - it should contain badges that indicate the build status (via Jenkins)
and the code quality (via SonarQube).
