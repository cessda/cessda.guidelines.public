---
title: "CA4: Modularity"
parent: Software Maturity Levels
nav_order: 425
---

# {{ page.title }}

- Minimum standard - SML3

- Expected standard - SML4

- Excellent standard - SML5

*SML1 - Initial usability:* There is evidence that the application was
created with no designs or consideration for organising it in
terms of functionality for modularity or use.
It may have been a demonstrator or pilot project.

*SML2 - Use is feasible:* There is no distinction between generic and
solution-specific functionality. If available, the source code is organised into a
primary system that provides general functionality and one or two
subsystems that each provide multiple, unrelated, functions.
Code within each module contains many independent logical paths.
The architecture is closed with only a few internal functions accessible by external
programs through the primary system.

*SML3 - Use is possible by most users:* There is evidence that the
architecture is open, with full structuring into individual components
that provide functions or interfaces to outside entities (i.e., open
architecture); internal functions or interfaces documented, but not
consistently; modules have been created for generic functions, but
modules have not been created for all of the specified functions.
Code within each module contains many independent logical paths.

*SML4 - Software is usable:* There is clear organisation of all
components into libraries or registries with consistent
documentation of all libraries as APIs or standard web service
interfaces. Modules have been created for all specified functions and
organised into libraries with consistent features within interfaces.
Code within each module may contain many independent logical paths.

*SML5 - Demonstrable usability:* It is evident that all functions and
data are encapsulated into objects or accessible through web service
interfaces. There is consistent error handling with meaningful messages
and advice, and use of generic extensions to program languages for
stronger type checking and compilation-time error checking.
Code within each module contains few independent logical paths.
