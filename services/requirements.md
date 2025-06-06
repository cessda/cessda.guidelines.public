---
title: Service Requirements
parent: Service Operation
nav_order: 210
---

# {{ page.title }}

CESSDA requires its tools and services to be of sufficient quality for sustainable operation.

The quality and acceptability criteria for CESSDA tools and services are defined by the
[CESSDA Software Maturity Levels]({% link sml/index.md %})
and the [EOSC Technology Readiness Levels (TRL)](https://web.archive.org/web/20220121063627/https://wiki.eosc-hub.eu/display/EOSC/Service+Maturity+Classification).

For a software system to be operated by CESSDA as a **TRL-8 production service**, the following criteria must be met:

* All applicable Software Maturity Level CAs must reach "Expected"
* The relevant programming language's style guide must be followed and enforced through linting
* The software [quality gate]({% link software/quality-gate.md %}) must be met

For a software system to be operated by CESSDA as a **TRL-7 beta service**, the following criteria must be met:

* All applicable Software Maturity Level CAs must reach "Expected"
* The quality gate is relaxed to 50% Code Test Coverage and 10% Duplicated Code Lines

For a software system to be considered as a candidate for future integration,
i.e. to form the basis for developing a service,
the following criteria must be met:

* All applicable Software Maturity Level CAs must reach "Minimum"
* The quality gate is relaxed to 50% Code Test Coverage and 10% Duplicated Code Lines
