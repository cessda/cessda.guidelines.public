---
title: Appendix 1 - Future Work
parent: Technical Architecture
published: true
nav_order: 540
---
## {{ page.title }}

Rather than producing theoretical guidance for all aspects,
it has been decided that a better approach is to couple the guidance to relevant phases of activity,
so that e.g. web usability guidance will be produced alongside the development of a component that has a User Interface
(such as the Data Catalogue), so that it can be shaped by feedback,
in the same way that the development of the Open Source Metadata Harvester has informed the specification of the development
environment.

### Web usability

Use responsive web design, so that applications can be used on smartphone, tablets, laptops and desktop devices.
To include minimum accessibility standards and HTML/CSS compliance levels that should be met.

- Navigation, carousel, menus

- Page layout and content

- Input

- Login and registration

- Form engine (including workflow?)

- Error handling

### Application Guidelines

- User Navigation

- User Input

- System Error Messages

- Logging (covered by 12 factor app, number 6 ([Logs - Treat logs as
    event streams](http://12factor.net/logs)).

### Application Level Security

- Identification, Authentication, Authorisation

- Input Data Validation

- Control of Internal processing

- Error Handling

- Cryptographic controls

- Documentation and procedures

- Logging

### Interoperability Standards

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

### Technical Environment

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

### Standard Operating Procedures

Deployment and in-life operations and maintenance of software artefacts are currently out of scope.

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

  - Application Management

### System Level

TBC

### System Isolation

TBC

### System Configuration and Hardening

Steps must be taken to protect software from the [OWASP Top 10](https://www.owasp.org/index.php/OWASP_Top_Ten_Cheat_Sheet) vulnerabilities.
Ideally this should be done centrally, rather than on an application by application basis.

### System Utilities

TBC

### Network Level

TBC

### Business Continuity

Assuming cloud-based deployment, first level of BC is provided by hosting service.
Second level (for Development Infrastructure) requires further consideration.

### Hosting Services

Deployment and in life operations and maintenance of software artefacts are currently out of scope.

Steps must be taken to ensure the storage location of PII is in accordance with EU guidelines.

The following should be considered at a later stage:

- Cloud Public/Private/Hybrid

- SaaS, PaaS, IaaS

### Demo/Proof of Concept

Do we need to allow for proof of concept deployments?
This could be helpful in cases where requirements are unclear, or demand needs to be tested.
For the time being, this is out of scope.

Factors to consider include:

- Where to deploy?

- Who has access (internal only or public beta)?

- Disposable or refactorable codebase?