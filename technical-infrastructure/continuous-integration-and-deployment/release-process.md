---
title: Release Process
parent: Continuous Integration and Deployment
grand_parent: Technical Infrastructure
---

# {{ page.title }}

## Terminology

See [Naming Conventions]({% link technical-infrastructure/naming-conventions.md %}).

## Current release process

The CESSDA software release process is partially automated, using continuous integration to automatically create test deployments.

Source code is built and unit tests are run in the component's source code repositories. The resulting artefact is a Docker image, with a tag set to the branch name and the build number of the build that created the image. This Docker image is deployed to the `development` cluster automatically.

The deployment pipeline automatically starts the test pipeline, which runs integration tests against the `development` deployment. If the integration tests pass the components deployed to `development` are deployed together to `staging`. This is the last automatic stage.

To release to production, the service owner will decide on a release date. By convention, this is usually a Tuesday. On this date, once the release checklist has been completed, the `deploy` job will be run against a specific `staging` build.

## Continuous deployment

CESSDA is implementing continuous deployment across its services.

Continuous deployment automatically deploys new code that is merged into the main branch of a repository to production once tests pass. It reduces the amount of effort needed to release new versions of software.

The code is build and tested using the same process as mentioned above, with unit tests run during the build pipeline and intergration tests run after the code has been deployed. One of the significant differences is that code is no longer deployed to the `development` cluster and is instead deployed directly to `staging`.

Integration tests are run against `staging`. Once these tests pass, the new code is deployed directly to production. There is no manual release process.

### Jenkinsfile

* Use `${GIT_COMMIT}` for image tags i.e. `${DOCKER_ARTIFACT_REGISTRY}/${productName}-${componentName}:${GIT_COMMIT}`
