---
title: Future Work
parent: Architectural Principles
grand_parent: Technical Infrastructure
published: false
nav_order: 3102
---

# {{ page.title }}

Guidance is produced either in advance of a new type or phase of development,
or based on the experience of undertaking a new type or phase of development.

## Web {% include glossary.html entry="usability" %}

Use responsive web design, so that applications can be used on smartphone, tablets, laptops and desktop devices.
To include minimum accessibility standards and HTML/CSS compliance levels that should be met.

In the meantime, the W3C standards site for [Web design and applications](https://www.w3.org/standards/webdesign/)
is a good place to find guidance.

## Application Guidelines

- User Navigation

- User Input

- System Error Messages

- Logging (covered by {% include glossary.html entry="{% include glossary.html entry="12 factor app" %}" %}, number 6
  ([Logs - Treat logs as event streams](http://12factor.net/logs)).

## Application Level Security

- Identification, Authentication, Authorisation

- Input Data Validation

- Control of Internal processing

- Error Handling

- Cryptographic controls

- Documentation and procedures

- Logging

## Interoperability Standards

- DDI C/L

- XML

- RDF

- OASIS Model

- WCAG 2.0

- ATAG 2.0

- SKOS

- METS (Metadata Encoding and Transmission Standard)

- OAIS

- Thesauri (ISO25964)

- INSPIRE (ISO19115)

## Technical Environment

- Hardware Architecture and Specifications

- Data Exchange

- Security Provisions

- Virtualisation

- Integration Capabilities

- Network Specifications and Sizing

- Storage, Backup and Archiving Systems

- Principles

- Policies

- Procedures

- Scalability

- Reliability

## Standard Operating Procedures

Deployment and in-life operations and maintenance of {% include glossary.html entry="software artefacts" %} are currently out of scope.

The following should be considered at a later stage:

- Bug Reporting

- Change Requests

- Software Deliveries

- Technical Infrastructure Tests

- Installations

- Installation Instructions

- System Operation Manual

  - HW and SW Architecture

  - Configuration

  - User Management

  - Backup and Restore

  - Monitoring

  - {% include glossary.html entry="Application" %} Management

## System Level

TBC

## System Isolation

TBC

## System Configuration and Hardening

Steps must be taken to protect software from the [OWASP Top 10](https://www.owasp.org/index.php/OWASP_Top_Ten_Cheat_Sheet) vulnerabilities.
Ideally this should be done centrally, rather than on an application by application basis.

## System Utilities

TBC

## Network Level

TBC

## Business Continuity

Assuming cloud-based deployment, first level of BC is provided by hosting service.
Second level (for Development Infrastructure) requires further consideration.

## Hosting Services

Deployment and in life operations and maintenance of {% include glossary.html entry="software artefacts" %} are currently out of scope.

Steps must be taken to ensure the storage location of PII is in accordance with EU guidelines.

The following should be considered at a later stage:

- Cloud Public/Private/Hybrid

- SaaS, PaaS, IaaS

## Demo/Proof of Concept

Do we need to allow for proof of concept deployments?
This could be helpful in cases where requirements are unclear, or demand needs to be tested.
For the time being, this is out of scope.

Factors to consider include:

- Where to deploy?

- Who has access (internal only or public beta)?

- Disposable or refactorable codebase?