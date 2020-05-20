---
title: "CA5: Packaging"
layout: page
parent: Software Maturity Levels
nav_order: 105
---

### CA5: Packaging

-   Minimum standard - SML3

-   Expected standard - SML4

-   Excellent standard - SML5

*SML1 - Initial usability:* Only source code or executable available;
i.e. no packaging to create a package or container. There is no, or
incomplete, configuration documentation and no deployment facility is
available. Even an experienced user may have difficulties deploying the
software.

*SML2 - Use is feasible:* Software includes package or container
creation. Detailed configuration instructions are available and
deployment is possible for an experienced user.

*SML3 - Use is possible by most users:* The packaged/containerised
software is easily configurable for different contexts as locations of
resources (files, directories, URLs) are configurable. All
configuration-specific information is centralised.

*SML4 - Software is usable:* Configurable scripts are available to
deploy the packaged/containerised software from the command line.
Versions of deployed software can be upgraded/rolled back from the
command line. Data and/or index files can be restored from the command
line.

*SML5 - Demonstrable usability:* A Continuous Integration server job (or
equivalent) is available to deploy the packaged/containerised software.
Administrators are notified if deployment fails. Versions of deployed
software can be upgraded/rolled back from a Continuous Integration
server job (or equivalent). Data and/or index files can be restored from
a Continuous Integration server job (or equivalent).
