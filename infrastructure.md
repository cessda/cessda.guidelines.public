---
title: Infrastructure Design
layout: page
---

# CESSDA Infrastructure Design

CESSDA Infrastructure is based on Docker Containers orchestrated by Kubernetes.

Thus any CESSDA service must follow the following design principles, following the [Twelve-Factor App](https://12factor.net/):

* Applications must be capsuled in individual Docker containers exposing ports.

* Configuration must be read from the environment on startup.

* Rest APIs
    * Use API versioning.
    * Provide [OpenAPI](https://www.openapis.org/) documentation.
    * Implement `X-Request-ID` headers.

* Logs must be streamed to `STDOUT` following [NSD JSON Schema](https://gitlab.nsd.no/logging/log-schema).


