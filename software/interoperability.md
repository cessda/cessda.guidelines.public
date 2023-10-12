---
title: Infrastructure Interoperability
parent: Software Development
nav_order: 120
---

# {{ page.title }}

CESSDA's Infrastructure is based on Docker Containers orchestrated by Kubernetes.

Thus any CESSDA service must follow the following design principles, building upon the [Twelve-Factor App](https://12factor.net/):

* Applications must be capsuled in individual Docker containers exposing ports.
* Configuration must be read from the environment on startup.
* Rest APIs
  * Use API versioning.
  * Provide [OpenAPI](https://www.openapis.org/) documentation.
  * Implement `X-Request-ID` headers.
* See [logging guidelines]({% link software/logging-guidelines.md %}) for further information regarding logging container output.

The software architecture is intended to meet CESSDA’s five common interoperability characteristics as follows.
In each case, CESSDA’s objective for the characteristic is stated, followed by the approach used to achieve it.

## Loosely coupled but coordinated

This characteristic enables components to retain independence, yet fully interact in an integrated service.
This approach is facilitated by the adoption of a microservices architecture based on
{% include glossary.html entry="REST" text="REST" %} web service APIs,
provides a mechanism for reusing and combining {% include glossary.html entry="(software artefacts)" text="software artefacts" %},
regardless of their implementation details or coding language.
<!-- TODO: Link to current API guidelines, should be merged into these guidelines -->
<!-- The [API design guidelines](https://github.com/cessda/cessda.guidelines.api/wiki/Home) are intended to ensure a level of consistency
(in both the calling and return structures and formats) that will reduce the burden of interacting with multiple services. -->

See also 12 factor, number 7 ([Port binding - Export services via port binding](https://12factor.net/port-binding)).

## Sustainable

Structure the service to enable medium and long term investment and business change decisions to be made.
The use of common standards (such as REST), a common development environment (such as Jenkins),
a test and deployment environment (such as Kubernetes)
and a central source-code repository will help reduce '{% include glossary.html entry="(technical debt)" text="technical debt" %}'
and hence facilitate business-driven change to the CESSDA {% include glossary.html entry="RI" text="RI" %}.

See also 12 factor app, number 1
([Codebase - One codebase tracked in revision control, many deploys](https://12factor.net/codebase)).

## Extensible

An extensible service enables additional services to be built on or around it, including adapting to changing functional requirements over time.
This is done by making the integration point the {% include glossary.html entry="API" text="API" %}.
New and/or existing services can be combined as required via their APIs to meet changing functional requirements.
Versioning the APIs and supporting two versions simultaneously allows services to evolve,
without breaking the contract they provide to their consumers.

See also 12 factor app, number 8
([Concurrency - Scale out via the process model](https://12factor.net/concurrency)).

See also 12 factor app, number 9
([Disposability - Maximise robustness with fast startup and graceful shutdown](https://12factor.net/disposability)).

## Maintainable

Enable components of a service to be updated when new development technologies are created.
Provided the {% include glossary.html entry="API" text="API" %} contract is maintained,
the implementation of a service can be changed as required to take advantage of developments in software technology.
The use of {% include glossary.html entry="REST" text="REST" %} APIs means that the location of services can be changed as required,
to take advantage of developments in hardware technology.

See also 12 factor app, number 2
([Dependencies - Explicitly declare and isolate dependencies](https://12factor.net/dependencies)).

## Standards based

Enable the coordinated and planned change to all the coupled, but coordinated, services.
The provision of common architectural standards (via this document),
in particular a consistent (in both the calling and return structures and formats)
and versioned {% include glossary.html entry="API" text="API" %} will reduce the burden of change.

See also 12 factor app, number 4
([Backing services - Treat backing services as attached resources](https://12factor.net/backing-services)).
