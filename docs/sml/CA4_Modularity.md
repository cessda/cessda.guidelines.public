---
title: "CA4: Modularity"
layout: page
parent: Software Maturity Levels
nav_order: 404
---

# CA4: Modularity

- Minimum standard - SML3

- Expected standard - SML4

- Excellent standard - SML5

*SML1 - Initial usability:* There is evidence that the source code was
written with no designs or consideration for organising the code in
terms of functionality for modularity or use. It may have been a
demonstrator or pilot project.

*SML2 - Use is feasible:* There is no distinction between generic and
solution-specific functionality. The source code is organised into a
primary system that provides general functionality and one or two
subsystems that each provide multiple, unrelated, functions; code within
each module contains many independent logical paths. The architecture is
closed with only a few internal functions accessible by external
programs through the primary system.

*SML3 - Use is possible by most users:* There is evidence that the
architecture is open, with full structuring into individual components
that provide functions or services to outside entities (i.e., open
architecture); internal functions or services documented, but not
consistently; modules have been created for generic functions, but
modules have not been created for all of the specified functions; code
within each module contains many independent logical paths.

*SML4 - Software is usable:* There is clear organisation of all
components into libraries or service registries with consistent
documentation of all libraries as APIs or standard web service
interfaces. Modules have been created for all specified functions and
organised into libraries with consistent features within interfaces, but
source code within each module may contain many independent logical
paths.

*SML5 - Demonstrable usability:* It is evident that all functions and
data are encapsulated into objects or accessible through web service
interfaces. There is consistent error handling with meaningful messages
and advice, and use of generic extensions to program languages for
stronger type checking and compilation-time error checking. Services are
available externally and code within each module contains few
independent logical paths.
