# <a name="cessda_software_maturity_levels">CESSDA Software Maturity Levels  
   
## Management Summary  


### Audience  

Potential suppliers of software artefacts for the CESSDA technical
research infrastructure. In the first instance, the CESSDA Service
Providers, but potentially any software development organisation.

### Purpose  

This document is based on an extract from CESSDA Technical Architecture
v1.0, May 2016 (the latest version of the latter can be found at \[5\]).
It was created so that readers interested in CESSDA's Software Maturity
Levels (SMLs) can find out more, without having to browse through the
entire Technical Architecture document.\
\
Usability is not only a political imperative of European Research
Infrastructure Consortiums' need to maximise their return on investment,
but is also essential for growth with limited funds and ongoing
interoperability.\
\
Mandating and checking the sustainability/usability of the software
components of CESSDA's technical Research Infrastructure is essential if
it is to strengthen and grow, however there are always risks attached,
for example: how much effort is required to integrate it into the
current technical framework, how will it be maintained, does it conform
to the standards required? Therefore the need to measure the maturity of
software designed for use by CESSDA is essential to ensure the quality
of the technical Research Infrastructure is maintained.

## Table of Contents  

[Glossary](#glossary)

[Scope](#scope)

[Summary](#summary)

[Software Maturity Levels](#software-maturity-levels)

[Objective](#objective)

[Background](#background)

[CESSDA Software maturity levels](#cessda-software-maturity-levels)

[CA1: Documentation](CA1_Documentation.md)
- [CA1.1: End-user Documentation](./CA1_Documentation.md)
- [CA1.2: Operational Documentation](./CA1_Documentation.md)  
- [CA1.3: Development Documentation](./CA1_Documentation.md)  

[CA2: Intellectual Property](./#CA2-Intellectual-Property.md)  

[CA3: Extensibility](./#CA3-Extensibility.md)  

[CA4: Modularity](./#CA4-Modularity.md)

[CA5: Packaging](./#CA5-Packaging.md)  

[CA6: Portability](./#CA6-Portability.md)

[CA7: Standards Compliance](./#CA7-Standards-Compliance.md)

[CA8: Support](./#CA8-Support.md)

[CA9: Verification and Testing](./#CA9-Verification-and-Testing.md)

[CA10: Security](./#CA10-Security.md)

[CA11: Internationalisation and Localisation](./#CA11-Internationalisation-and-Localisation.md)

[CA12: Authentication and Authorisation](./#CA12-Authentication-and-Authorisation.md)

[References](#references)


## <a name="glossary"></a>Glossary


| **Acronym**   | **Expansion**               | **Description** |
|----------------------|----------------------|----------------------|
| API      |     Application Programming Interface |   *"In computer programming, an application programming interface (API) is a set of routines, protocols, and tools for building software and applications."* Source: [[Wikipedia: Application programming interface]](https://en.wikipedia.org/wiki/Application_programming_interface)|
 | CI      |      Continuous Integration      |         *"The practice, in software engineering, of merging all developer working copies to a shared [mainline](https://en.wikipedia.org/wiki/Trunk_(software)) several times a day."* Source: [[Wikipedia: Continuous Integration]](https://en.wikipedia.org/wiki/Continuous_integration)|
 | RI       |     \[CESSDA\] Research Infrastructure |  "*A seamless social science data archive service for the whole of the European Research Area (ERA), which is capable of supporting the research needs of the next generation of social scientists wherever in Europe they may be, or beyond."* Source: [[CESSDA SaW project overview]](https://www.cessda.eu/Projects/All-projects/CESSDA-SaW)|
 | \-      |      Software artefacts           |        Software products, applications, services, components.|


## <a name="scope"></a>Scope

CESSDA Software Maturity Levels.

## <a name="summary"></a>Summary


This document lays out an approach for assessing the maturity of the
components of the technical Research Infrastructure (RI), so that over
time CESSDA can mandate minimum levels that Service Providers (SPs) and
others have to meet as a prerequisite to supplying software artefacts
for the RI.


## <a name="software-maturity-levels"></a>Software Maturity Levels


### <a name="objective"></a>Objective

Mandating the sustainability/usability of the software components of the
technical Research Infrastructure is essential if CESSDA is to
strengthen and grow. There are risks attached to adopting software
systems and components, for example: how much effort is required to
integrate it into the current technical framework?, how will it be
maintained?, does it conform to the standards required? Therefore the
need to measure the maturity of software used within CESSDA is essential
to ensure the quality of the technical Research Infrastructure is
maintained. Reuse Readiness Levels (RRLs) \[1\], as developed by NASA
Earth Science Data Systems, form the basis upon which the CESSDA
software maturity assessments are made. Usability is not only a
political imperative of research infrastructures as they need to
demonstrate a return on investment, but is also essential for growth
with limited funds and ongoing interoperability.

### <a name="background"></a>Background

The measurement of maturity can be achieved in various ways. Services
(and service management) use Capability Maturity Modelling, for example
FitSM \[2\]. A method commonly used for technology is the 9 point
Technology Readiness Levels (TRLs) scale \[3\], however this does not
address usability, which is essential for the development of CESSDA's
technical Research Infrastructure. RRLs address this gap in the
assessment of the maturity of software artefacts. Note that the EU
adopted TRLs as part of the H2020 programme \[4\] and both FitSM and
TRLs have been subsequently adopted by the EOSC-hub, which mandates that
TRL Level 8 is the minimum acceptable for a system to be considered
production-ready by them. Interestingly, both RRLs and TRLs were devised
by and are widely used by NASA.\
\
RRLs define 9 levels of maturity ranging from 1 ("software is not
recommended for reuse") to the most mature 9 ("software is being reused
by many classes of users..."), however if we are to align a software
maturity assessment model with the CESSDA Capability Development Model
(CESSDA-CDM) for Service Providers (CESSDA-SaW WP3, deliverable D3.1)
then it would be prudent to reduce the number of levels to 5. The
following tables provides a mapping from the NASA RRL via CMM to CESSDA
Software Maturity Levels (SMLs). Note that in the CESSDA context,
'reuse' becomes 'use' as typically components are commissioned, rather
than re-purposed.

Table 1 shows the correspondence between the various levels in the RRL,
CML and SML scales. Given that one of CESSDA's goals is to have its
tools and services listed in the EOSC Market Place, the requirements
imposed by CESSDA will be continuously adopted to ensure compliance.


| **Reuse Readiness Levels** | **Capability Maturity Levels** | **CESSDA Software maturity levels**|
|----------------------|----------------------|----------------------|
|RRL1 - Limited reusability; not recommended for reuse. RRL2 - Initial reusability; reuse not practical|CMM1 Initial (chaotic, ad hoc or reactive)|SML1 - Initial usability; software use is not recommended.|
|RRL3 - Basic reusability; might be reusable by skilled users at substantial effort, cost, and risk. RRL4 - Reuse is possible; might be reused by most users with some effort, cost, and risk.|CMM2 Repeatable (active)|SML2 - Use is feasible; the software can be used by skilled personnel but with considerable effort, cost and risk. Assessment of effort, cost and risk shall be made before use is attempted.|
RRL5 - Reuse is possible; might be reused by most users with some effort, cost, and risk.|CMM3 Defined (proactive)|SML3 - Use is possible by most users;  with some effort, cost, and risk. A risk assessment should be made before use.|
RRL6 - Software is reusable; the software can be reused by most users although there may be some cost and risk. RRL7 - Software is highly reusable; the software can be reused by most users with minimum cost and risk.|CMM4 Managed|SML4 - Software is usable; with little effort, cost, and risk.|
|RRL8 - Demonstrated local reusability; the software has been reused by multiple users. RRL9 - Demonstrated extensive reusability; the software is being reused by many classes of users over a wide range of systems.|CMM5 Optimised|SML5 - Demonstrable usability; there is clear evidence that the software is widely used by many users.|


* <a name="table1"></a>Table 1: Correspondence of levels in RRL, CML and SML scales*    


## <a name="cessda-software-maturity-levels"></a>CESSDA Software maturity levels


The software maturity levels provide guidance on what minimum, expected
and excellent standards look like, and will be used to evaluate the
products produced by SPs.\
\
*[[Next section](#ca1_documentation)]*
