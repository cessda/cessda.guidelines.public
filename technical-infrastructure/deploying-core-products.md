---
title: Deploying Core Products to Production
parent: Technical Infrastructure
nav_order: 370
---

# {{ page.title }}

## Terminology

See [Naming Conventions]({% link technical-infrastructure/naming-conventions.md %}).

## Overview

This is the procedure for deploying a new version of a CESSDA core {% include glossary.html entry="(product)" text="product" %}
(one of CDC, CVS, EQB, ELSST) to the production environment.

## Relevant Roles

See the 'Product Coordination' document for definition of roles.

- Technical Maintainer
- Service Owner
- User Group
- Platform Maintainer

## Preparing for a Release

To prepare for a release, the service owner creates a release issue in the issue tracker.

- The recommend pattern for issue title is *'Release version X.Y.Z of \<tool name\>'* where X.Y.Z is the release version number
- The issue should state the general purpose of the release, as well as the most significant issues that either need to be, or have been, resolved
- The issue should also contain links to issues regarding the following subtasks
  - Creating the release notes, which contain a list of all issues and PRs that are part of the release
  - Updating user facing documentation with new features/changed behaviour
- The issue should include a checklist of steps that are necessary for a release
  - Backups before release
  - Upgrade procedures for dependency updates
  - Reserve a DOI in Zenodo and add it to the changelog
- The issue should also contain links to the release checklist and the release report

Before the release can be performed the service owner must approve the release in writing in the release issue, or state the reason why the release cannot be performed (e.g. bugs, design changes, test failures).

## Performing the Release

Once all pre-release activities have been concluded and the release has been approved, the release can be performed.

- The source code repositories must [tagged](https://git-scm.com/book/en/v2/Git-Basics-Tagging) with the release version number. The format used is X.Y.Z.
- The service maintainer verifies that the tagged build is successfully deployed to the staging environment.

Deploying to production happens via production deployment jobs, which are postfixed with `deploy.prod` in Jenkins. These jobs automatically tag Docker images as production images, then call the deployment script of the product with the tagged images. The deployment script will deploy the tagged images to the production cluster. This is done by the platform maintainer.

## Verifying the Release

The platform maintainer verifies that the components were deployed correctly, typically by inspecting the deployment using the Kubernetes console.

Once a basic check is performed, the service owner is notified so that wider scale functionality tests can occur.

If problems are discovered by either the service owner or the platform maintainer, the release can be reverted.

## Publishing the Release

Once the service owner is satisfied that the release is stable, the user group and any other interested parties are notified via communication channels (emails, IM...).

The release is formally published on Zenodo (with a DOI reference) and GitHub (using the releases feature).

Once the release is formally published and announced, the release issue and corresponding milestone are closed.
