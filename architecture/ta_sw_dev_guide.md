---
title: Software Development Guidelines
parent: Technical Architecture
published: true
nav_order: 525
---
# {{ page.title }}

The CESSDA development infrastructure offers a number of benefits for
potential suppliers of software artefacts for the CESSDA Research
Infrastructure, not least of which is a ready made development
environment that can be used at no cost, and will increase the
likelihood of software artefacts meeting the agreed acceptance criteria.

## Software code structure

Code should be well structured, commented and with minimum complexity.
Code blocks should not be repeated (i.e. the DRY principle, see e.g.
[Wikipedia Don't repeat yourself](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself) page),
so avoid 'cut and paste' coding techniques.
A good rule of thumb is for the coder to ask themselves "has this been implemented with the least amount of code necessary?"

Although no language-specific coding conventions are mandated,
the 'Coding conventions for languages' section of the [Wikipedia Coding
conventions](https://en.wikipedia.org/wiki/Coding_conventions)
page is a useful reference source for language-specific guidelines, if required.

Strings in general should be externalised.
In particular, messages intended to be displayed to the User via the GUI,
console or other output mechanism should not be present in source code as this inhibits language localisation.
Also source code should be free of configuration information in order to comply with
12 factor app principle number 3 [Config - Store config in the environment](http://12factor.net/config)).
Configuration information should be made available at run time via environment variables.

## Environment-specific information

The 12 factor app, number 10
([Dev/prod parity - Keep development, staging, and production as similar as possible](http://12factor.net/dev-prod-parity))
points to the need to deploy new developments quickly,
involve the developers in deployment and keep the tools as similar as possible through the development,
testing and deployment environments.
In order to achieve this in the current climate, some form of container can be used.
As [Docker](https://www.docker.com/) is the de facto standard which has been widely used in Linux environments for some time
and is now available for MS Windows users, then its use is mandated until further notice.

Containers need some form of orchestration, and again a de facto standard has emerged,
in this case in the form of [Kubernetes](https://kubernetes.io).
Kubernetes aims to provide production-grade container scheduling and management and its use is mandated until further notice.

Although it is tempting to specify a short list of (types and versions of) operating systems,
database technologies, NoSQL tools and implementation language etc to be adopted by developers and thus used in production,
it would severely limit the flexibility of potential solutions over time,
as well as increasing the barriers to entry for CESSDA's suppliers.

## Compliance with earlier design decisions

This document is to be taken as **the primary source** of information about decisions intended to guide and inform the development
and delivery of software artefacts by CESSDA's suppliers.
As such, the latest version should be referred to before undertaking any development work on CESSDA's behalf.

That said, detailed 'how to' guides are made available via the publically available CESSDA Technical Guidelines documentation.
See for instance the [guidelines for Developers](https://docs.tech.cessda.eu/software/index.html).

## Documentation throughout the development lifecycle

The following documentation types must be made available in the relevant parts of the *docs* directory
of the source code repository for the software artefact,
and should be maintained and updated throughout the development process, up to the acceptance testing phase:

### Operational

- Installation guide (configuration details for deployment,
    see also 12 factor app, number 3 [Config - Store config in the environment](http://12factor.net/config))

### Development

- Source code commented throughout;
    Requirements (functional and non-functional, including wireframes for any UI components)
    API documentation, extension/developer's guide; Systems architecture (fit with CESSDA RI);
    Technical specification (implementation details);
    Test cases and results (de facto recorded by the Continuous Integration and Test process,
    and are best examined there in order to ensure they are current)

- Customisation/use guide

## End-user

End user documentation may be added prior to release, and is not a pre-requisite for delivery.
It should be created and maintained using the 'documentation as code' approach,
in a repository named cessda.xxx.userguide, where **'xxx'** is the 3 letter abbreviation for the product,
also used as the [Bitbucket project key](https://bitbucket.org/cessda/workspace/projects/).

The following types are expected:

- User guide

- Tutorials

- Release notes

## Acceptance

The following types of tests will be performed, prior to formal acceptance by CESSDA:

- Documentation;

- Intellectual property issues;

- Extensibility;

- Modularity;

- Packaging;

- Portability;

- Standards compliance;

- Support;

- Verification and testing;

- Security;

- Internationalisation and Localization;

- Authentication and Autjorisation.

The level to be attained will be determined by the prevailing CESSDA software maturity level (which is expected to change over time).
See [Software Maturity Levels]({% link sml/cessda-software-maturity-levels.md %}) for more details.

What checks should suppliers make to increase the likelihood of acceptance?
They are expected to use the CIT environment from the start of the development process,
so that they address the code quality requirements from the onset.
Also that way, they can notify CESSDA MO when they have a release candidate,
and the test results can easily be inspected as the code is already in the CESSDA environment.

Jenkins has been chosen as the CI server for the following reasons:

- Standards: a de facto standard for CI

- Familiarity - experience of configuration and/or use amongst several
    CESSDA SPs;

- Features: provides tried and tested CI; links with Bitbucket and other SCM systems;
    hundreds of free plugins available;
    can build and deploy containers;

- Configuration as code: job configuration details (in the form of Jenkinsfiles) are held in source code repositories that they refer to.

## Source code management

The Bitbucket SCM system has been mandated, and each product has its own project (containing one or more repositories) within the
[CESSDA Research Infrastructure project space](https://bitbucket.org/cessda/workspace/projects/).
Each repository is linked to the CIT environment via a Jenkinsfile and corresponding Jenkins jobs,
so that software quality assurance takes place throughout the development phase.

The choice of Bitbucket was based on a combination of standards, familiarity, features and transferability:

- Standards: a de facto standard for SCM; supports Git and Mercurial repositories;

- Familiarity: experience of configuration and/or use amongst several CESSDA SPs;

- Features: provides tried and tested distributed SCM; links with CI tools such as Jenkins; has built in issue tracker and wiki;

- Transferability: can export code and commit history to other Git repository hosting solutions.

In this way, the source code for products and components deployed within the CESSDA Research Infrastructure
will be available to CESSDA throughout their life.
No product or component will be deployed without the source code first being made available in this way
(with the exception of COTS products and products built from Open Source projects).

See also 12 factor app, number 1 ([Codebase - One codebase tracked in revision control, many deploys](http://12factor.net/codebase)).

## Security and Privacy

### Privacy Assessment

Assess the privacy impact rating using the following guidelines
(taken from the [Simplified Implementation of the Microsoft SDL](https://www.microsoft.com/en-us/securityengineering/sdl/howto)):

- *P1 High Privacy Risk. The feature, product, or service stores or
    transfers personally identifiable information (PII), changes
    settings or file type associations, or installs software.*

- *P2 Moderate Privacy Risk. The sole behaviour that affects privacy
    in the feature, product, or service is a one-time, user-initiated,
    anonymous data transfer (for example, the user clicks on a link
    and the software goes out to a Web site).*

- *P3 Low Privacy Risk. No behaviours exist within the feature,
    product, or service that affect privacy. No anonymous or personal
    data is transferred, no personally identifiable information (PII) is stored on the machine,
    no settings are changed on the user's behalf, and no software is installed.*

Steps must be taken to protect PII that are appropriate for the level of
privacy risk and ensure the storage location is in accordance with EU
data protection directives, in particular GDPR.
