---
title: Technical Architecture
has_children: true
published: false
nav_order: 500
---

# {{ page.title }}

## Management Summary

### Audience

Potential suppliers of software artefacts for the CESSDA RI. In the
first instance, the CESSDA Service Providers, but potentially any
software development organisation.

### Purpose

The ambition is to promote good software development practice across the
Service Provider community, in respect of the provision of software
artefacts intended for use as part of the CESSDA Research
Infrastructure.

It is important to ensure that the source code for every product is
centrally available, so that all Service Providers can access it, thus
increasing the options for maintaining and extending the various
artefacts, whilst protecting CESSDA's investment in its Research
Infrastructure.

The publication of basic standards for source code quality will ensure
Service Providers know what is expected of them.

The introduction of a build server linked to the source code repository
will ensure that all source code is automatically tested to ensure it
meets common coding standards, that there is adequate test case coverage
and that basic interoperability standards have been met. It will mean
that remedial action can be highlighted well before deliverable due
dates, and can act as an input to the interim and final reviews.

Without an intentional (as opposed to ad-hoc or emergent) Technical
Architecture, there is a danger that the CESSDA common interoperability
characteristics may be addresses in such diverse and incompatible manner
that the intended benefits do not materialise, resulting in a Research
Infrastructure that is not joined up, that duplicates data and/or
metadata, with components that can only be installed, configured or
operated by the Service Providers that developed them.

Without an intentional Technical Architecture, there is a high
likelihood that the User experience of the CESSDA RI user community will
be sub-optimal in many ways.

The combination of the development infrastructure (including the
automated build and test facility) and the Technical Architecture will
help establish a development maturity level for both the CESSDA Research
Infrastructure and the individual Service Providers. Future work plans
can contain actions specifically targeted on raising this maturity
level, which will in turn reduce maintenance and development costs,
whilst improving the experience of the CESSDA RI's user community.

Ideally there should be a common means of accessing all of the
functionality offered by the various products (i.e. a CESSDA portal with
a consistent look and feel) to ensure the User Journey is uniform and
predictable, regardless of the destination. Whilst the development of
such a unifying user interface is yet to be agreed (much less planned or
commissioned), the Technical Architecture should reduce the overhead of
retro-fitting such a component at a later date.

## Table of Contents

[Management Summary](#management-summary)

[Audience](#audience)

[Purpose](#purpose)

[Table of Contents](#table-of-contents)

[Glossary](#glossary)

[Scope](#scope)

[Summary](#summary)

[Meeting CESSDA's common interoperability
characteristics](#meeting-cessdas-common-interoperability-characteristics)

[Loosely coupled but
coordinated](#loosely-coupled-but-coordinated)

[Sustainable](#sustainable)

[Extensible](#extensible)

[Maintainable](#maintainable)

[Standards based](#standards-based)

[Software Development
Guidelines](#software-development-guidelines)

[Software code structure](#software-code-structure)

[Environment-specific
information](#environment-specific-information)

[Compliance with earlier design
decisions](#compliance-with-earlier-design-decisions)

[Documentation throughout the development
lifecycle](#documentation-throughout-the-development-lifecycle)

[Operational](#operational)

[Development](#development)

[End-user](#end-user)

[Acceptance](#acceptance)

[Source code management](#source-code-management)

[Security and Privacy](#security-and-privacy)

[Privacy Assessment](#privacy-assessment)

[Software Maturity Levels](#software-maturity-levels)

[Objective](#objective)

[Background](#background)

[References](#references)

[Appendix 1 - Future Work](#appendix-1---future-work)

[Web usability](#web-usability)

[Application Guidelines](#application-guidelines)

[Application Level
Security](#application-level-security)

[Interoperability
Standards](#interoperability-standards)

[Technical Environment](#technical-environment)

[Standard Operating
Procedures](#standard-operating-procedures)

[System Level](#system-level)

[System Isolation](#system-isolation)

[System Configuration and
Hardening](#system-configuration-and-hardening)

[System Utilities](#system-utilities)

[Network Level](#network-level)

[Business Continuity](#business-continuity)

[Hosting Services](#hosting-services)

[Demo/Proof of Concept](#demoproof-of-concept)

[Appendix 2 - Current State of the Development
Infrastructure](#appendix-2---current-state-of-the-development-infrastructure)

[Service Integration](#service-integration)

[Appendix 3 - Enhancing the Technical
Architecture](#appendix-3---enhancing-the-technical-architecture)

## Glossary

| Acronym       | Expansion                          | Description                                                                                                                                                                                                                                                                                        |
|---------------|------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 12 factor app | Heroku Twelve-Factor App           | “The twelve-factor app is a methodology for building software-as-a-service apps.” Source: The Twelve-Factor App                                                                                                                                                                                    |
| API           | Application Programming Interface  | “In computer programming, an application programming interface (API) is a set of routines, protocols, and tools for building software and applications.” Source: Wikipedia: Application programming interface                                                                                      |
| CI            | Continuous Integration             | “The practice, in software engineering, of merging all developer working copies to a shared mainline several times a day.” Source: Wikipedia: Continuous Integration                                                                                                                               |
| CT            | Continuous Testing                 | “The process of executing automated tests as part of the software delivery pipeline to obtain immediate feedback on the business risks associated with a software release candidate.” Source: Wikipedia: Continuous Testing                                                                        |
| CIT           | Continuous Integration and Testing | A combination of CI and CT                                                                                                                                                                                                                                                                         |
| COTS          | Commercial Off The Shelf [product] | “Products that are standard manufactured products rather than custom, or bespoke, products.” Source: Wikipedia: Commercial off-the-shelf                                                                                                                                                           |
| REST          | Representational State Transfer    | “An architectural style consisting of a coordinated set of architectural constraints applied to components, connectors, and data elements, within a distributed hypermedia system.” Source: Wikipedia: REST                                                                                        |
| RI            | [CESSDA] Research Infrastructure   | “A seamless social science data archive service for the whole of the European Research Area (ERA), which is capable of supporting the research needs of the next generation of social scientists wherever in Europe they may be, or beyond.” Source:  CESSDA SaW project overview                  |
| SCM           | Source Code Management [system]    | A system for “the management of changes to … computer programs.” Source: Wikipedia: Version Control                                                                                                                                                                                                |
| -             | Software artefacts                 | Software products, applications, services, components.                                                                                                                                                                                                                                             |
| -             | Technical debt                     | “Work that needs to be done before a particular job can be considered complete or proper. If the debt is not repaid, then it will keep on accumulating interest, making it hard to implement changes later on.”  Source: Wikipedia: Technical debt                                                 |
| -             | Usability                          | “The degree to which a product can be used by specified consumers to achieve quantified objectives with effectiveness, efficiency, and satisfaction in a quantified context of use.” Source: Ergonomic Requirements for Office Work with Visual Display Terminals, ISO 9241-11, ISO, Geneva, 1998. |

## Scope

Software development (from requirements, through design, documentation
and testing to acceptance).

Deployment and in-life operations and maintenance are currently out of
scope.

## Summary

This document provides guidance for developers of components for the
CESSDA Research Infrastructure. However, it does not aim to address all
aspects at present, only those that are relevant to the current tranche
of work plan tasks. User Interface development guidelines are one of the
deliberate omissions at this stage, as the current components are
headless. It does provides guidance on meeting CESSDA's common
interoperability characteristics, as they apply across the board.

It is envisaged that subsequent versions will address those areas that
are needed by developers of the contemporary RI components, so that
feedback on their completeness and usefulness can be obtained in
context.

In the same way, deployment will be address in a later version, as and
when the first components are ready to go into production.

It also lays out an approach for assessing the maturity of RI
components, so that over time CESSDA can mandate minimum levels that SPs
and others have to meet as a prerequisite to supplying software
artefacts for the RI.

## Meeting CESSDA's common interoperability characteristics

The software architecture is intended to meet CESSDA's five common
interoperability characteristics as follows. In each case, CESSDA's
objective for the characteristic is stated, followed by the approach
used to achieve it.

### Loosely coupled but coordinated

*Objective: enable Service Providers to retain independence, yet fully
interact in an integrated service*

Approach: the adoption of a (micro) services architecture based on
RESTful web service APIs provides a mechanism for reusing and combining
software artefacts, regardless of their implementation details or coding
language. The [API design
guidelines](https://bitbucket.org/cessda/cessda.guidelines.api/wiki/Home)
are intended to ensure a level of consistency (in both the calling and
return structures and formats) that will reduce the burden of
interacting with multiple services.

See also 12 factor app, number 7 ([Port binding - Export services via
port binding](http://12factor.net/port-binding)).

### Sustainable

*Objective: enable medium and long term investment and business change
decisions to be made*.

Approach: The provision of common standards (via this document), a
common development and test environment (via the technical
infrastructure) and deployment environment (via extensions to the
technical infrastructure) and a central source-code repository will help
reduce 'technical debt' and hence facilitate business-driven change to
the CESSDA RI.

See also 12 factor app, number 1 ([Codebase - One codebase tracked in
revision control, many
deploys](http://12factor.net/codebase)).

### Extensible

*Objective: enable additional services to be built on or around it,
including adapting to changing functional requirements over time.*

Approach: New services can be added as required, as the integration
point is the API. New and/or existing services can be combined as
required via their APIs to meet changing functional requirements.
Versioning the APIs and supporting two versions simultaneously allows
services to evolve, without breaking the contract they provide to their
consumers.

See also 12 factor app, number 8 ([Concurrency - Scale out via the
process model](http://12factor.net/concurrency)).

See also 12 factor app, number 9 ([Disposability - Maximize robustness
with fast startup and graceful
shutdown](http://12factor.net/disposability)).

### Maintainable

*Objective: enable components to be updated when IT specifications
change.*

Approach: Provided the API contract is maintained, the implementation of
a service can be changed as required, to take advantage of developments
in software technology. The use of RESTful APIs means that the location
of services can be changed as required, to take advantage of
developments in hardware technology.

See also 12 factor app, number 2 ([Dependencies - Explicitly declare
and isolate
dependencies](http://12factor.net/dependencies)).

### Standards based

*Objective: enable the coordinated and planned change to all the
coupled, but coordinated, services.*

Approach: The provision of common architectural standards (via this
document), in particular a consistent (in both the calling and return
structures and formats) and versioned API will reduce the burden of
change.

See also 12 factor app, number 4 ([Backing services - Treat backing
services as attached
resources](http://12factor.net/backing-services)).

## Software Development Guidelines

The CESSDA development infrastructure offers a number of benefits for
potential suppliers of software artefacts for the CESSDA Research
Infrastructure, not least of which is a ready made development
environment that can be used at no cost, and will increase the
likelihood of software artefacts meeting the agreed acceptance criteria.

### Software code structure

Code should be well structured, commented and with minimum complexity.
Code blocks should not be repeated (i.e. the DRY principle, see e.g.
[Wikipedia Don't repeat
yourself](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself)
page), so avoid 'cut and paste' coding techniques. A good rule of thumb
is for the coder to ask themselves "has this been implemented with the
least amount of code necessary?"

Although no language-specific coding conventions are mandated, the
'Coding conventions for languages' section of the [Wikipedia Coding
conventions](https://en.wikipedia.org/wiki/Coding_conventions)
page is a useful reference source for language-specific guidelines, if
required.

Strings in general should be externalised. In particular, messages
intended to be displayed to the User via the GUI, console or other
output mechanism should not be present in source code as this inhibits
language localisation. Also source code should be free of configuration
information in order to comply with 12 factor app principle number 3
[Config - Store config in the
environment](http://12factor.net/config)). Configuration
information should be made available at run time via environment
variables.

## Environment-specific information

The 12 factor app, number 10 ([Dev/prod parity - Keep development,
staging, and production as similar as
possible](http://12factor.net/dev-prod-parity)) points to
the need to deploy new developments quickly, involve the developers in
deployment and keep the tools as similar as possible through the
development, testing and deployment environments. In order to achieve
this in the current climate, some form of container can be used. As
[Docker](https://www.docker.com/) is the de facto standard
which has been widely used in Linux environments for some time and is
coming to MS Windows soon, then its use should be adopted until further
notice.

Although it is tempting to specify a short list of (types and versions
of) operating systems, database technologies, NoSQL tools and
implementation language etc to be adopted by developers and thus used in
production, it would severely limit the flexibility of potential
solutions over time, as well as increasing the barriers to entry for
CESSDA's suppliers.

### Compliance with earlier design decisions

This document is to be taken as [the primary source]{.underline} of
information about decisions intended to guide and inform the development
and delivery of software artefacts by CESSDA's suppliers. As such, the
latest version should be referred to before undertaking any development
work on CESSDA's behalf.

That said, detailed 'how to' guides are made available via the CESSDA
SCM. See for instance the [API
guidelines](https://bitbucket.org/cessda/cessda.guidelines.api/wiki/Home)
or the [guidelines for
Developers](https://bitbucket.org/cessda/cessda.guidelines.cit/wiki/Developers).

### Documentation throughout the development lifecycle

The following documentation types must be made available in the relevant
parts of the *docs* directory of the source code repository for the
software artefact, and should be maintained and updated throughout the
development process, up to the acceptance testing phase:

### Operational

- Installation guide (configuration details for deployment, see also
    12 factor app, number 3 [Config - Store config in the
    environment](http://12factor.net/config))

### Development

- Source code commented throughout

- Requirements (functional and non-functional, including wireframes
    for any UI components)

- API documentation, extension/developer's guide

- Systems architecture (fit with CESSDA RI)

- Technical specification (implementation details)

- Test cases and results (de facto recorded by the Continuous
    Integration and Test process, and are best examined there in order
    to ensure they are current)

- Customisation/use guide

Templates will be
[provided](https://bitbucket.org/cessda/cessda.guidelines.doc-templates)
for each document type, to provide guidance on what should be included
and help ensure consistency. They will also contain the rudiments of the
[Secure Development
Lifecycle](https://www.owasp.org/index.php/Secure_SDLC_Cheat_Sheet).

### End-user

End user documentation may be added prior to release, and is not a
pre-requisite for delivery. The following types are expected:

- User guide

- Tutorials

- Release notes

## Acceptance

The following types of tests will be performed, prior to formal
acceptance by CESSDA:

- Documentation;

- Intellectual property issues;

- Extensibility;

- Modularity;

- Packaging;

- Portability;

- Standards compliance;

- Support;

- Verification and testing;

- Internationalisation and Localization.

The level to be attained will be determined by the prevailing CESSDA
software maturity level (which is expected to change over time). See the
section 'Software Maturity Levels' below for more details.

What checks should suppliers make to increase likelihood of acceptance?
They are expected to use the CIT environment from the start of the
development process, so that they address the code quality requirements
from the onset. Also that way, they can notify CESSDA MO when they have
a release candidate, and the test results can easily be inspected as the
code is already in the CESSDA environment.

Jenkins has been chosen as the CI server for the following reasons:

- Standards - a de facto standard for CI

- Familiarity - experience of configuration and/or use amongst several
    CESSDA SPs;

- Features - provides tried and tested CI; links with Bitbucket and
    other SCM systems; hundreds of free plugins available; can build
    and deploy containers;

- Transferability - can export job configuration details in plain text
    (XML) format.

## Source code management

The Bitbucket SCM system has been mandated, and each development will
have its own repository (or suite of repositories) within the [CESSDA
Research Infrastructure
project](https://bitbucket.org/account/user/cessda/projects/CRI).
Each repository will be linked to the [CIT
environment](https://bitbucket.org/cessda/cessda.guidelines.cit/wiki/Home),
so that software quality assurance can take place throughout the
development phase.

The choice of Bitbucket was based on a combination of standards,
familiarity, features and transferability:

- Standards - a de facto standard for SCM; supports Git and Mercurial
    repositories;

- Familiarity - experience of configuration and/or use amongst several
    CESSDA SPs;

- Features - provides tried and tested distributed SCM; links with CI
    tools such as Jenkins; has built in issue tracker and wiki;

- Transferability - can export code and commit history to other Git
    repository hosting solutions.

In this way, the source code for products and components deployed within
the CESSDA Research Infrastructure will be available to CESSDA
throughout their life. No product or component will be deployed without
the source code first being made available in this way (with the
exception of COTS products and products built from Open Source
projects).

See also 12 factor app, number 1 ([Codebase - One codebase tracked in
revision control, many
deploys](http://12factor.net/codebase)).

## Security and Privacy

### Privacy Assessment

Assess privacy Impact rating using the following guidelines (taken from
the 'Simplified Implementation of the Microsoft SDL'):

- *P1 High Privacy Risk. The feature, product, or service stores or
    transfers personally identifiable information (PII), changes
    settings or file type associations, or installs software.*

- *P2 Moderate Privacy Risk. The sole behaviour that affects privacy
    in the feature, product, or service is a one-time, user-initiated,
    anonymous data transfer (for example, the user clicks on a link
    and the software goes out to a Web site).*

- *P3 Low Privacy Risk. No behaviours exist within the feature,
    product, or service that affect privacy. No anonymous or personal
    data is transferred, no PII is stored on the machine, no settings
    are changed on the user\'s behalf, and no software is installed.*

Steps must be taken to protect PII that are appropriate for the level of
privacy risk and ensure the storage location is in accordance with EU
data protection directives.

## References

[1] The Twelve-Factor App, <http://12factor.net>

## Appendix 1 - Future Work

Rather than producing theoretical guidance for all aspects, it has been
decided that a better approach is to couple the guidance to relevant
phases of activity, so that e.g. web usability guidance will be produced
alongside the development of a component that has a User Interface (such
as the Products and Services catalogue), so that it can be shaped by
feedback, in the same way that the development of the Open Source
Metadata Harvester has informed the specification of the development
environment.

### Web usability

Use responsive web design, so that applications can be used on
smartphone, tablets, laptops and desktop devices. To include minimum
accessibility standards and HTML/CSS compliance levels that should be
met.

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

Deployment and in-life operations and maintenance of software artefacts
are currently out of scope.

The following should be considered at a later stage:

- Bug Reporting

- Change Requests

- Software Deliveries

- Technical Infrastructure Tests

- Installations

- Installation Instructions

- System Operation Manual

  * HW and SW Architecture

  * Configuration

  * User Management

  * Backup and Restore

  * Monitoring

  * Application Management

### System Level

TBC

### System Isolation

TBC

### System Configuration and Hardening

Steps must be taken to protect software from the [OWASP Top
10](https://www.owasp.org/index.php/OWASP_Top_Ten_Cheat_Sheet)
vulnerabilities. Ideally this should be done centrally, rather than on
an application by application basis.

### System Utilities

TBC

### Network Level

TBC

### Business Continuity

Assuming cloud-based deployment, first level of BC is provided by
hosting service. Second level (for Development Infrastructure) requires
further consideration.

### Hosting Services

Deployment and in life operations and maintenance of software artefacts
are currently out of scope.

Steps must be taken to ensure the storage location of PII is in
accordance with EU guidelines.

The following should be considered at a later stage:

- Cloud Public/Private/Hybrid

- SaaS, PaaS, IaaS

### Demo/Proof of Concept

Do we need to allow for proof of concept deployments? This could be
helpful in cases where requirements are unclear, or demand needs to be
tested. For the time being, this is out of scope.

Factors to consider include:

- Where to deploy?

- Who has access (internal only or public beta)?

- Disposable or refactorable codebase?

## Appendix 2 - Current State of the Development Infrastructure

At the date of publication of this version of the Technical Architecture
document, the CESSDA development infrastructure consists of the
following components:

- A set of Bitbucket repositories containing documentation for
    developers and administrators, relating to various topics,
    including how to gain access to the source code repositories, how
    to grant access to the source code repositories, technical
    guidelines for API development, and documentation templates. These
    are grouped together as the [CESSDA Architectural Guidelines
    project](https://bitbucket.org/account/user/cessda/projects/CAG).

- A set of Bitbucket repositories containing source code for various
    RI components. Each components is allocated one or more
    repositories, with new ones created on demand. These are grouped
    together as the [CESSDA Research Infrastructure
    project](https://bitbucket.org/account/user/cessda/projects/CRI).
    The current repositories are for the metadata harvester and
    associated handlers.

- A Jenkins job for each repository, which is called by a post-commit
    hook

- An issue tracker for each repository (within the Bitbucket
    environment).

- A wiki for selected repositories (within the Bitbucket environment).

In addition, the cloud-based services listed below have all been set up.
This is to ease sharing and/or transfer of administration
rights between individuals, as no personal data is associated with the
accounts, and all service notifications are sent to the same inbox.

| Type                              | Description                                                                                                                       | System (see above)                 | Location                                         |
|-----------------------------------|-----------------------------------------------------------------------------------------------------------------------------------|------------------------------------|--------------------------------------------------|
| Collaborative document management | Multi-author environment with change tracking, for non-source code file types, such as documents, spreadsheets and presentations. | Google Drive                       | https://drive.google.com                         |
| DVCS/SCM                          | Distributed version control system - repositories for storing and sharing source code.                                            | Bitbucket (Git repositories)       | https://bitbucket.org                            |
| File storage                      | Linkable/embeddable storage option for non-source code file types, such as documents, spreadsheets and presentations.             | Google Drive                       | https://drive.google.com                         |
| Email                             | Email account to use as primary contact for all other accounts. Can be used as OpenId style login credentials for other accounts. | Gmail                              | https://mail.google.com                          |
| Code execution environment        | Spin up containers/VMs and deploy code on demand. Execute                                                                         | Google Cloud Platform              | https://cloud.google.com                         |
| Chatroom                          | Set up open or closed topic-specific discussion spaces, e.g. developer community (closed) and user community (open).              | HipChat                            | https://cessda.hipchat.com/chat/lobby            |
| Issue Tracker                     | Create and manage source code-specific discussions and (technical) details.                                                       | Per repository option in Bitbucket | https://bitbucket.org                            |
| Wiki                              | Create and manage source code-specific discussions and (technical) details.                                                       | Per repository option in Bitbucket | https://bitbucket.org                            |
| CI Server                         | Continuous Integration server, runs build and test jobs against source code repositories.                                         | Jenkins                            | Hosted on Google Cloud Platform                  |
| CIT                               | Continuous Integration and Testing environment. Requires a CI server, an execution environment  and various build and test tools. | Combination of services            | See details for each component service           |
| System Availability Monitor       | Periodically check (24/7) that web site or other HTTP(S) service is available                                                     | Uptime Robot                       | https://uptimerobot.com/                         |
| Avatar                            | Some form of ‘identity’ to associate with the CessdaTechFrame account                                                             | Gravatar                           | https://en.gravatar.com                          |
| Microservice registry             | Similar concept to GitHub etc - version control and access/sharing for containers                                                 | Docker Hub, Google Cloud Platform  | https://hub.docker.com/ https://cloud.google.com |

### Service Integration

There are a number of links between components of the development
environment, as detailed below. These typically ensure that a change
made to one is automatically reflected in the other.

| From      | To        | Purpose                                                                                                          | In place?                                                                                             |
|-----------|-----------|------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------|
| Bitbucket | HipChat   | Post repository events to associated chat room (alternative to email notifications). Event list is configurable. | Yes*  [* done on per repository/room combination, so needs to be configured for each new repository.] |
| Bitbucket | Jenkins   | Post commit hook - trigger a build when content of repository is updated.                                        | Yes* [* done on per repository/job combination, so needs to be configured for each new repository.]   |
| Jenkins   | Bitbucket | Checkout code from one or more repositories (for build, test, style check or other purposes).                    | Yes* [* done on per job/repository combination, so needs to be configured for each new job.]          |
| Jenkins   | Bitbucket | Include issue tracker IDs in builds for traceability                                                             | N/A* [* IDs need to be entered manually by developers as part of commit comments.]                    |

## Appendix 3 - Enhancing the Technical Architecture

A future version of the document must define a model for how to propose,
discuss and accept enhancements to the architecture. Change requests are
inevitable and there should be a transparent way to handle them. Without
such a governance model, it may appear that enhancement decisions are
chaotic, whimsical, unfair, or unjustified.

In particular, changes to the scores for Minimum, Expected and Excellent
standards for each of the CESSDA Software use maturity level criteria
must be agreed in an open manner and communicated swiftly and
effectively to SPs and other interested parties.
