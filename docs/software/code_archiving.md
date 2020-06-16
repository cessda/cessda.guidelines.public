---
title: Code Archiving
layout: page
parent: Software Development
nav_order: 160
---

# CESSDA code archiving

In certain cases, CESSDA can ensure continued access to open source code of orphaned software
developed in research projects associated with CESSDA.

If this is agreed with CESSDA ERIC, the following requirements must be met

* The intellectual property must be assigned to CESSDA ERIC.
* Licenses and contributors must be clearly stated.
* The purpose and original development reason (such as grant specifications) must be clearly stated.
* The projects must have an appropriate [README]({{ site.technical-reference.url }}developer-guidelines/02-readme.html),
  which makes clear that development has ceased.

Before ownership can be transferred, the following must be done

* The final version of the code must be [published]({% link docs/software/publication.md %})
  with appropriate metadata identifying its origin and submitted to the [CESSDA Community](https://zenodo.org/communities/cessda).
* The code must be available at [Software Heritage](https://www.softwareheritage.org/archive/).
* The Zenodo DOI and Software Heritage links must be included in the README.
* The repository's orphaned status must be made clear in the README and its title has to carry the appropriate badge:

```markdown
 # Title ![unmaintained](https://img.shields.io/badge/repository-unmaintained-red.svg)
```
