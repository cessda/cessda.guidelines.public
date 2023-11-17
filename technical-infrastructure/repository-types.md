---
title: Repository Types
parent: Technical Infrastructure
nav_order: 350
---

# {{ page.title }}

## Terminology

See [Naming Conventions]({% link technical-infrastructure/naming-conventions.md %}).

## Overview

There are three types repositories used in the CI/CD process; {% include glossary.html entry="(component)" text="component" %} repositories and {% include glossary.html entry="(deployment)" text="deployment" %} repositories.

### Component repositories

Component repositories contain the source code for components for various CESSDA applications. The {% include glossary.html entry="(component)" text="component" %} repository also contain the Dockerfile which builds the Docker image for the component. These repositories are usually public; the exceptions being source code which CESSDA deems is not of the required standard, or internal scripts which have negligible utility outside of CESSDA.

### Deployment repositories

Deployment repositories contain scripts and deployment manifests that deploy components and dependencies to Kubernetes clusters. These repositories are private within the CESSDA GitHub organisation, and write access is restricted to members of the CESSDA Platform Team. These repositories are postfixed with `.deploy` (e.g. `cessda.cdc.deploy`).

### Management repositories

Management repositories contain scripts, deployment manifests and sometimes Docker configuration for components deployed to support CESSDA applications. These include CI/CD, static analysis and monitoring tooling. These repositories are private within the CESSDA GitHub organisation, and write access is restricted to members of the CESSDA Platform Team. These repositories are prefixed with `cessda.mgmt` (e.g. `cessda.mgmt.prometheus`).

The distinction between these different repository types separates the repositories containing the application software (which are usually public) from those containing the deployment scripts and other sensitive elements (which are private).
