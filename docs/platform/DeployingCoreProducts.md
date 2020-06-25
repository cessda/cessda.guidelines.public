---
title: Deploying Core Products to Production
layout: page
parent: Technical Infrastructure
nav_order: 307
---

# Deploying Core Products to Production

This is the proceedure for deploying a new version of a CESSDA Core Product (one of CDC, CVS, EQB, ELSST) to the production environmemt.

## Terminology

See [Naming Conventions]({% link docs/platform/NamingConventions.md %}).

## Relevant Roles

See the 'Tool Coordination' document [NEED LOCATION TO LINK TO] for definition of roles.

- Technical Contact

- Content Contact

- User Group

- Platform Contact

### Technical Contact

Creates an issue in the tool-specific issue tracker in Bitbucket,
changes the status to OPEN and assigns it to the Content Contact for the
tool.

- Recommend pattern for issue title is *'Release version X.Y.Z of \<tool name\> to production'*

- For traceability, the version number of the release **must** be included in the issue.

- The relevant repos must be [tagged](https://confluence.atlassian.com/bitbucket/repository-tags-321860179.html) with the release version number.

- For verification purposes, the [changelog](https://keepachangelog.com/en/1.0.0/) **must** be referenced.

Remedies any reported defects, updates the issue accordingly and re-assigns the issue to the Content Contact.

### Content Contact

Checks version X.Y.Z of the tool in the staging environment, to ensure
the reported changes are present and correct. Involve the User Group in
evaluating the changes, if required.

Changes issue status to RESOLVED if the reported changes are present and
correct and assigns the issue to the Platform Contact. Or leaves the
issue status as OPEN, updates the issues with details of the defects,
and re-assigns it to the Technical Contact.

### Platform Contact

Deploys the specified version of the tool to production (provided the
issue is marked as RESOLVED), checks that the deployment has succeeded
and closes the issue.
