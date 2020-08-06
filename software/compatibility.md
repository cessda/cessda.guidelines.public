---
title: Infrastructure Compatiblity
parent: Software Development
nav_order: 120
---

# {{ page.title }}

CESSDA Infrastructure is based on Docker Containers orchestrated by Kubernetes.

Thus any CESSDA service must follow the following design principles, building upon the [Twelve-Factor App](https://12factor.net/):

* Applications must be capsuled in individual Docker containers exposing ports.

* Configuration must be read from the environment on startup.

* Rest APIs
  * Use API versioning.
  * Provide [OpenAPI](https://www.openapis.org/) documentation.
  * Implement `X-Request-ID` headers.

* See [logging guidelines]({% link software/logging-guidelines.md %}) for further information re logging container output.
