---
title: CESSDA Quality Requirements
layout: page
---

# CESSDA Quality Requirements

CESSDA requires its software-based tools and services to be of sufficient quality for sustainable operation.

The quality and acceptability criteria for CESSDA tools and services are defined by the
[CESSDA Software Maturity Levels](./SoftwareMaturityLevels/CESSDA_Software_Maturity_Levels.md)
and the [EOSC Technology Readiness Levels (TRL)](https://wiki.eosc-hub.eu/display/EOSC/Service+Maturity+Classification).

For a software system to be operated by CESSDA as a TRL-8 production service, the following criteria must be met:

* All applicable Software Maturity Level CAs must reach "Expected"
* The relevant programming language's style guide must be followed and enforced through linting
* The [quality gate]({% link quality_gate.md %}) must be met
* The average [availability]({% link availability.md %}) must be at least 99.9%
* The [SSL server configuration]({% link ssl_configuration.md %}) must be consistently rated at 'A' or above


For a software system to be operated by CESSDA as a TRL-7 beta service, the following criteria must be met:

* All applicable Software Maturity Level CAs must reach "Expected"
* The quality gate is relaxed to 50% Code Test Coverage and 10% Duplicated Code Lines
* The average availability must be at least 90.0%
* The SSL server configuration must be rated at 'B' or above


For a software system to be considered as a candidate for future integration, the following criteria must be met:

* All applicable Software Maturity Level CAs must reach "Minimum"
* The quality gate is relaxed to 50% Code Test Coverage and 10% Duplicated Code Lines
* The average availability is not relevant
* The SSL server configuration must be rated at 'B' or above
