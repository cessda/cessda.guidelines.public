---
title: Technical Architecture
has_children: true
published: true
nav_order: 500
---

# {{ page.title }}

## Management Summary

### Audience

Potential suppliers of software artefacts for the CESSDA RI.
In the first instance, the CESSDA Service Providers, but potentially any
software development organisation.

### Purpose

The ambition is to promote good software development practice across the Service Provider community,
in respect of the provision of software artefacts intended for use as part of the CESSDA Research
Infrastructure.

It is important to ensure that the source code for every product is centrally available,
so that all Service Providers can access it,
thus increasing the options for maintaining and extending the various artefacts,
whilst protecting CESSDA's investment in its Research Infrastructure.

The publication of basic standards for source code quality will ensure
Service Providers know what is expected of them.

The use of a build server linked to the source code repository will ensure that all source code is automatically tested to ensure it meets common coding standards,
that there is adequate test case coverage and that basic interoperability standards have been met.
It will mean that remedial action can be highlighted well before deliverable due
dates,
and can act as an input to the interim and final reviews.

Without an intentional (as opposed to ad-hoc or emergent) Technical
Architecture,
there is a danger that the CESSDA common interoperability
characteristics may be addresses in such a diverse and incompatible manner
that the intended benefits do not materialise,
resulting in a Research Infrastructure that: is not joined up; duplicates data and/or
metadata;
contains components that can only be installed, configured or
operated by the Service Providers that developed them.

Without an intentional Technical Architecture,
there is a high likelihood that the User experience of the CESSDA RI user community will be sub-optimal in many ways.

The combination of the development infrastructure
(including the automated build and test facility)
and the Technical Architecture will help establish a development maturity level for both the CESSDA Research
Infrastructure and the individual Service Providers.
Future work plans can contain actions specifically targeted on raising this maturity
level,
which will in turn reduce maintenance and development costs,
whilst improving the experience of the CESSDA RI's user community.

Ideally there should be a common means of accessing all of the
functionality offered by the various products
(i.e. a CESSDA portal with a consistent look and feel)
to ensure the User Journey is uniform and predictable, regardless of the destination.
Whilst the development of such a unifying user interface is yet to be agreed
(much less planned or commissioned),
the Technical Architecture should reduce the overhead of retro-fitting such a component at a later date.
