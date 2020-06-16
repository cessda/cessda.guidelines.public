---
title: "CA3: Extensibility"
layout: page
parent: Software Maturity Levels
nav_order: 403
---

# CA3: Extensibility

- Minimum standard - SML3

- Expected standard - SML4

- Excellent standard - SML5

*SML1 - Initial usability:* The software was not designed with
extensibility in mind, so there is either no ability to extend or modify
program behavior, or it is very difficult to do, even for usages similar
to those of the software core design; execution parameters cannot be
changed. There is no, or limited, availability of the source code; the
logical flow of code may be hard to follow, with little to no cohesion.

*SML2 - Use is feasible:* There is some consideration to extensibility,
but that may only exist for a limited number of use cases, through use
of methods such as object-oriented design or other tools which provide
logical cohesion. Some extensibility is possible through configuration
changes; isolation of configuration parameters and constants in clearly
identified sections of source code; and/or limited opportunity for
software modification.

Where source code is available, there is evidence that there is
effective use of programming practices designed to enable use, such as
object oriented design.

*SML3 - Use is possible by most users:* Future extensibility is designed
into the system for a moderate range of use cases. The procedures for
extending the software are defined, whether by source code modification
or through the provision of some type of extension functionality (e.g.,
callback hooks or scripting capabilities). Where source code
modification is part of the extension plan, the software is
well-structured, has a moderate to high level of cohesion, and has
configuration elements clearly separated from logic and display
elements.

*SML4 - Software is usable:* The extensibility capability for the
software is well defined, broad range of use cases, providing many
points of extensibility. A detailed extensibility plan is publically
available and is sufficient to allow an experienced developer to become
familiar with the project to extend the software in a reasonable amount
of time. Documentation should include clear information about the range
of use cases to which the software can be extended as well as potential
limitations on expansion.

There is evidence that the software has been extended and applied to a
context to the original. This extension may have been done by another
group or project, using extension documentation, but may have involved
ad hoc and substantial assistance from the original development team.

*SML5 - Demonstrable usability:* There is evidence that the software has
been extended externally by users outside of the original development
group using existing documentation only. There is a clear approach for
modifying and extending features across a in multiple scenarios, with
specific documentation and features to allow the building of extensions
which are used across a range of domains by multiple user groups. There
may be a library available of user-generated content for extensions and
user generated documentation on extension is also available.
