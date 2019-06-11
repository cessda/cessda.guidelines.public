# CESSDA Technical Guidelines

This repository contains the technical guidelines for CESSDA ERIC.

## Introduction

The components of the CESSDA infrastructure are subject to CESSDA's developer and operational guidelines.

At a minimum, the recommendations of the [EURISE Network Technical Reference, v0.1](https://technical-reference.readthedocs.io/en/v0.1/)
must be followed.

## CESSDA requirements

For all CESSDA tools and services the following requirements must be met

* The code must be in CESSDA-owned git-repositories on Bitbucket.
* The tool's [license](https://technical-reference.readthedocs.io/en/v0.1/developer-guidelines/01-basics.html) must be clearly stated.
  * Unless otherwise agreed, APACHE-2.0 should be used.
  * Include the full license text in a `LICENSE.txt` in the repository root.
  * Ensure all files cary a short header, preferrably through its [SPDX indentifier](https://spdx.org/) `SPDX-License-Identifier: MIT OR Apache-2.0`.
* The Intellectual Property must be clear.
* A comprehensive [README](https://technical-reference.readthedocs.io/en/v0.1/developer-guidelines/02-readme.html) must be present.
* The tool must be of proven acceptable [quality](quality.md).
* Include contribution guidelines based on the [CONTRIBUTING.md template](CONTRIBUTING.md).

See also our [policy for archiving source code repositories](archiving.md).

