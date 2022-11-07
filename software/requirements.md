---
title: Software Requirements
parent: Software Development
nav_order: 110
---

# {{ page.title }}

For all CESSDA products and tools the following requirements must be met

* The product's [license]({{ site.technical-reference.url }}developer-guidelines/01-basics.html) must be clearly stated.
  * Unless otherwise agreed, [APACHE-2.0](https://choosealicense.com/licenses/apache-2.0/) should be used.
  * Include the full license text in a `LICENSE.txt` in the repository root.
  * Ensure all files carry a short header, preferably through its [SPDX identifier](https://spdx.org/)
  `SPDX-License-Identifier: Apache-2.0`.
* The Intellectual Property must be clear.
* A comprehensive [README]({{ site.technical-reference.url }}developer-guidelines/02-readme.html) must be present.
* The product must be of proven acceptable [quality]({% link software/quality-gate.md %}).
* The CESSDA [release policy]({% link software/releases.md %}) must be followed.
* Documentation of Rest APIs is available using [OpenAPI Standard](https://swagger.io/docs/specification/about/).
* The product must be aligned with CESSDA [infrastructure design]({% link software/interoperability.md %})
  and meet applicable [Service Requirements]({% link services/requirements.md %}).
* Include contribution guidelines based on the [CONTRIBUTING.md template](../CONTRIBUTING_template.md).
