# CESSDA Quality Requirements

CESSDA requires its tools and services to be of sufficient quality for sustainable operation.

The quality and acceptability criteria for CESSDA tools and services is defined by the [CESSDA Software Maturity Levels](https://doi.org/10.5281/zenodo.2614050).

For a service to be operated by CESSDA, the following criteria must be met

* All applicable CAs must be met at "Expected"
* The relevant programing language's style guide must be followed and enforced through linting
* unit testing coverage must be at 80% or above

For a service to be considered for future integration, all Maturity Levels' CAs must reach "Minimum".

CESSDA's build, test and deploy pipline uses a [quality gate](quality_gate.md) to check the quality of software before it is deployed.
