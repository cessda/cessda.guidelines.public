---
title: Home
layout: home
---

# CESSDA Technical Guidelines

This repository contains the technical guidelines for CESSDA ERIC.

## Introduction

The components of the CESSDA infrastructure are subject to CESSDA's developer and operational guidelines.

At a minimum, the recommendations of the [EURISE Network Technical Reference, v0.1](https://technical-reference.readthedocs.io/en/v0.1/)
must be followed.

## CESSDA requirements

For all CESSDA tools and services the following requirements must be met

* The code must be in CESSDA-owned git-repositories on Bitbucket.
    * If the code is developed publicly elsewhere, mirroring with clear pointers to the upstream are used.
* The tool's [license](https://technical-reference.readthedocs.io/en/v0.1/developer-guidelines/01-basics.html) must be clearly stated.
    * Unless otherwise agreed, APACHE-2.0 should be used.
    * Include the full license text in a `LICENSE.txt` in the repository root.
    * Ensure all files cary a short header, preferrably through its [SPDX indentifier](https://spdx.org/) `SPDX-License-Identifier: Apache-2.0`.
* The Intellectual Property must be clear.
* A comprehensive [README](https://technical-reference.readthedocs.io/en/v0.1/developer-guidelines/02-readme.html) must be present.
* The tool must be of proven acceptable [quality]({% link quality.md %}).
* The CESSDA [release policy]({% link releases.md %}) must be followed.
* Documentation of Rest APIs is available using [OpenAPI Standard](https://swagger.io/docs/specification/about/).
* The tool must be aligned with CESSDA [infrastructure design]({% link infrastructure.md %}).
* Include contribution guidelines based on the [CONTRIBUTING.md template](CONTRIBUTING_template.md).

See also our [policy for archiving source code repositories]({% link archiving.md %}).

