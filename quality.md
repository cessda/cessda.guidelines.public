# CESSDA Quality Requirements

CESSDA requires its tools and services to be of sufficient quality for sustainable operation.

The quality and acceptability criteria for CESSDA tools and services are defined by the
[CESSDA Software Maturity Levels](./SoftwareMaturityLevels/CESSDA_Software_Maturity_Levels.md)
and the [EOSC Technology Readiness Levels (TRL)](https://wiki.eosc-hub.eu/display/EOSC/Service+Maturity+Classification).

For a software to be operated by CESSDA as a TRL-8 production service, the following criteria must be met

* All applicable CAs must be met at "Expected"
* The relevant programing language's style guide must be followed and enforced through linting
* The [quality gate](quality_gate.md) must be met

For a software to be operated by CESSDA as a TRL-7 beta service,
the quality gate can be relaxed to 50% Code Test Coverage and 10% Duplicated Code Lines.

For a software to be considered as a candidate for future integration,
all Maturity Levels' CAs must reach "Minimum", the same lowered quality gate applies.

