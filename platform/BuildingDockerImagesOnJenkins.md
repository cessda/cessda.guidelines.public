---
title: Building Docker Images on Jenkins
parent: Technical Infrastructure
has_children: true
nav_order: 360
---

# {{ page.title }}

## Terminology

See [Naming Conventions]({% link platform/NamingConventions.md %}).

## Overview

To build and run applications on the CESSDA GCP environment, Docker containers must be created via Jenkins.
This automation ensures that all applications are produced with common naming and deployment conventions.

## For Developers

See [Adding the Build Jenkinsfile]({% link platform/AddingTheBuildJenkinsfile.md %})

## For Platform team

See [Adding the Deployment Jenkinsfile]({% link platform/AddingTheDeploymentJenkinsfile.md %})
