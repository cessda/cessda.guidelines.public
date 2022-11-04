---
title: Architectural Principles
parent: Technical Infrastructure
published: true
nav_order: 310
---

# {{ page.title }}

## Terminology

See [Naming Conventions]({% link technical-infrastructure/naming-conventions.md %}).

## Overview

### Audience

Potential suppliers of {% include glossary.html entry="(software artefacts)" text="software artefacts" %} for the CESSDA Research Infrastructure
({% include glossary.html entry="RI" text="RI" %}).
In the first instance, the CESSDA Service Providers, but potentially any software development organisation.

### Purpose

The ambition is to promote good software development practice across the Service Provider community,
in respect of the provision of {% include glossary.html entry="(software artefacts)" text="software artefacts" %}
intended for use as part of the {% include glossary.html entry="RI" text="RI" %}.

It is important to ensure that the source code for every  {% include glossary.html entry="(product)" text="product" %} is centrally available,
so that all Service Providers can access it,
thus increasing the options for maintaining and extending the various artefacts,
whilst protecting CESSDA's investment in its {% include glossary.html entry="RI" text="RI" %}.

The publication of basic standards for source code quality will ensure Service Providers know what is expected of them.

The provision of a common development toolchain (including a build server linked to the source code repository,
and a continuous code inspection system) facilitates the use of *fail fast* techniques such as Quality Gates.
This will ensure that all source code is automatically tested to check that it meets common coding standards,
that there is adequate test case coverage and that basic interoperability standards are met.
As a result, substandard code cannot make its way in to production, instead any necessary remedial actions will be highlighted.

Without an intentional (as opposed to ad-hoc or emergent) Technical Architecture,
there is a danger that the [CESSDA common interoperability]({% link technical-infrastructure/architecture-interoperability.md %})
characteristics may be addressed in such a diverse and incompatible manner that the intended benefits do not materialise,
resulting in a {% include glossary.html entry="RI" text="RI" %} that:

- is not joined up

- duplicates data and/or metadata

- contains components that can only be installed, configured or operated by the Service Providers that developed them.

- provides a sub-optimal User experience in many ways.

The combination of a common development toolchain and the [Software Maturity Levels]({% link sml/index.md %})
will help to establish a development maturity level for both the {% include glossary.html entry="RI" text="RI" %}
and the individual Service Providers.
Future work plans can contain actions specifically targeted on raising this maturity level,
which will in turn reduce maintenance and development costs, whilst improving the {% include glossary.html entry="RI" text="RI" %} User Experience.

Ideally there should be a common means of accessing all of the functionality offered by the various products
(i.e. a CESSDA portal with a consistent look and feel)
to ensure the User Journey is uniform and predictable, regardless of the destination.
Whilst the development of such a unifying user interface is yet to be agreed,
a [style guide](https://doi.org/10.5281/zenodo.2631263) has been produced to help User Interface developers adopt a common look and feel.
In followed, the Architectural principles should reduce the overhead of retro-fitting such a
{% include glossary.html entry="(component)" text="component" %} at a later date.
