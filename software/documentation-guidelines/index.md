---
title: Documentation Guidelines
parent: Software Development
has_children: true
published: true
nav_order: 180
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
12 factor app principle number 3 [Config - Store config in the environment](https://12factor.net/config)).
Configuration information should be made available at run time via environment variables.

## Environment-specific information

The 12 factor app, number 10
([Dev/prod parity - Keep development, staging, and production as similar as possible](https://12factor.net/dev-prod-parity))
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

That said, detailed 'how to' guides are made available via the publicly available CESSDA Technical Guidelines documentation.
See for instance the [guidelines for Developers](https://docs.tech.cessda.eu/software/index.html).

## Documentation throughout the development life-cycle

### End-user

End user documentation may be added prior to release, and is not a pre-requisite for delivery.
It should be created and maintained using the [documentation as code approach]({% link software/content-management.md %}).

See [End User documentation guidelines]({% link software/documentation-guidelines/enduser-documentation.md %}).

Operational and Development documentation must be made available
and should be maintained and updated throughout the development process,
up to the acceptance testing phase.

### Operational

See [Operational documentation guidelines]({% link software/documentation-guidelines/operational-documentation.md %}).

### Development

See [Development documentation guidelines]({% link software/documentation-guidelines/development-documentation.md %}).

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

- Internationalisation and Localisation;

- Authentication and Authorisation.

The level to be attained will be determined by the prevailing CESSDA software maturity level (which is expected to change over time).
See [Software Maturity Levels]({% link sml/index.md %}) for more details.

What checks should suppliers make to increase the likelihood of acceptance?
They are expected to use the {% include glossary.html entry="CIT" text="CIT" %} environment from the start of the development process,
so that they address the code quality requirements from the onset.
Also that way, they can notify CESSDA MO when they have a release candidate,
and the test results can easily be inspected as the code is already in the CESSDA environment.

Jenkins has been chosen as the {% include glossary.html entry="CI" text="CI" %} server for the following reasons:

- Standards: a de facto standard for {% include glossary.html entry="CI" text="CI" %}

- Familiarity: experience of configuration and/or use amongst several CESSDA SPs

- Features: provides tried and tested {% include glossary.html entry="CI" text="CI" %};
    links with Bitbucket and other {% include glossary.html entry="SCM" text="SCM" %} systems;
    hundreds of free plugins available;
    can build and deploy containers

- Configuration as code: job configuration details (in the form of Jenkinsfiles)
    are held in source code repositories that they refer to

## Source code management

The Bitbucket {% include glossary.html entry="SCM" text="SCM" %} system has been mandated,
and each product has its own project (containing one or more repositories) within the
[CESSDA Research Infrastructure project space](https://github.com/cessda).
Each repository is linked to the {% include glossary.html entry="CIT" text="CIT" %}
environment via a Jenkinsfile and corresponding Jenkins jobs,
so that software quality assurance takes place throughout the development phase.

The choice of Bitbucket was based on a combination of standards, familiarity, features and transferability:

- Standards: a de facto standard for {% include glossary.html entry="SCM" text="SCM" %}; supports Git and Mercurial repositories;

- Familiarity: experience of configuration and/or use amongst several CESSDA SPs;

- Features: provides tried and tested distributed {% include glossary.html entry="SCM" text="SCM" %};
    links with {% include glossary.html entry="CI" text="CI" %} tools such as Jenkins; has built in issue tracker and wiki;

- Transferability: can export code and commit history to other Git repository hosting solutions.

In this way, the source code for products and components deployed within the CESSDA Research Infrastructure
will be available to CESSDA throughout their life.
No product or component will be deployed without the source code first being made available in this way
(with the exception of {% include glossary.html entry="COTS" text="COTS" %} products and products built from Open Source projects).

See also 12 factor app, number 1 ([Codebase - One codebase tracked in revision control, many deploys](https://12factor.net/codebase)).
