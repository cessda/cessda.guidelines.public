---
title: Software Maturity Levels
has_children: true
nav_order: 400
---

# {{ page.title }}

## Management Summary

### Audience

Potential suppliers of software artefacts for the CESSDA technical
research infrastructure. In the first instance, the CESSDA Service
Providers, but potentially any software development organisation.

### Purpose

This document was created so that readers interested in CESSDA's Software
Maturity Levels (SMLs) can find out more about the various attributes,
levels and expectations that underpin them.

Usability is not only a political imperative of European Research
Infrastructure Consortiums' need to maximise their return on investment,
but is also essential for growth with limited funds and ongoing
interoperability.

Mandating and checking the sustainability/usability of the software
components of CESSDA's technical Research Infrastructure is essential if
it is to strengthen and grow, however there are always risks attached,
for example: how much effort is required to integrate it into the
current technical framework, how will it be maintained, does it conform
to the standards required? Therefore the need to measure the maturity of
software designed for use by CESSDA is essential to ensure the quality
of the technical Research Infrastructure is maintained.

## Summary

This document lays out an approach for assessing the maturity of the
components of the technical Research Infrastructure (RI), so that over
time CESSDA can mandate minimum levels that Service Providers (SPs) and
others have to meet as a prerequisite to supplying software artefacts
for the RI.

## Software Maturity Levels

### Objective

Mandating the sustainability/usability of the software components of the
technical Research Infrastructure is essential if CESSDA is to
strengthen and grow. There are risks attached to adopting software
systems and components, for example: how much effort is required to
integrate it into the current technical framework?, how will it be
maintained?, does it conform to the standards required? Therefore the
need to measure the maturity of software used within CESSDA is essential
to ensure the quality of the technical Research Infrastructure is
maintained. Reuse Readiness Levels [RRLs][1], as developed by NASA
Earth Science Data Systems, form the basis upon which the CESSDA
software Maturity Assessment CMA qualities are made. Usability is not only a
political imperative of research infrastructures as they need to
demonstrate a return on investment, but is also essential for growth
with limited funds and ongoing interoperability.

[1]: https://cdn.earthdata.nasa.gov/conduit/upload/2004/RRLs_v1.0.pdf

### Background

The measurement of maturity can be achieved in various ways.
Services use Capability Maturity Modelling within Service Management framework
such as [FitSM][2].
A method commonly used for technology is the
[Technology Readiness Levels (TRLs)][3] scale.
However this does not address usability, which is essential for the development
of CESSDA's technical Research Infrastructure. RRLs address this gap in the
assessment of the maturity of software artefacts. Note that the EU
adopted TRLs as part of the [H2020 programme][4] and both FitSM and
TRLs have been subsequently adopted by the EOSC, which mandates that
TRL Level 8 is the minimum acceptable for a system to be considered
production-ready by them. Interestingly, both RRLs and TRLs were devised
by and are widely used by NASA.

[2]: https://fitsm.itemo.org/fitsm
[3]: https://wiki.eosc-hub.eu/display/EOSC/Service+Maturity+Classification
[4]: https://ec.europa.eu/research/participants/data/ref/h2020/other/wp/2016-2017/annexes/h2020-wp1617-annex-ga_en.pdf

Table 1 shows the correspondence between the various levels in the RRL
and SML scales. Given that one of CESSDA's goals is to have its
tools and services listed in the [EOSC portal][5], the requirements
imposed by CESSDA will be continuously adopted to ensure compliance.

| Reuse Readiness Levels                                                                                                                                                                                                   | CESSDA Software maturity levels                                                                                                                                                               |
|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| RRL1 - Limited reusability; not recommended for reuse. RRL2 - Initial reusability; reuse not practical                                                                                                                   | SML1 - Initial usability; software use is not recommended.                                                                                                                                    |
| RRL3 - Basic reusability; might be reusable by skilled users at substantial effort, cost, and risk. RRL4 - Reuse is possible; might be reused by most users with some effort, cost, and risk.                            | SML2 - Use is feasible; the software can be used by skilled personnel but with considerable effort, cost and risk. Assessment of effort, cost and risk shall be made before use is attempted. |
| RRL5 - Reuse is possible; might be reused by most users with some effort, cost, and risk.                                                                                                                                | SML3 - Use is possible by most users;  with some effort, cost, and risk. A risk assessment should be made before use.                                                                         |
| RRL6 - Software is reusable; the software can be reused by most users although there may be some cost and risk. RRL7 - Software is highly reusable; the software can be reused by most users with minimum cost and risk. | SML4 - Software is usable; with little effort, cost, and risk.                                                                                                                                |
| RRL8 - Demonstrated local reusability; the software has been reused by multiple users. RRL9 - Demonstrated extensive reusability; the software is being reused by many classes of users over a wide range of systems.    | SML5 - Demonstrable usability; there is clear evidence that the software is widely used by many users.                                                                                        |

**Table 1:** *Correspondence of levels in RRL and SML scales*

## CESSDA Software maturity levels

The software maturity levels provide guidance on what minimum, expected
and excellent standards for each of CMA qualities.
These will be used to evaluate the products produced by SPs and any other
development organisation.

[5]: https://marketplace.eosc-portal.eu/
