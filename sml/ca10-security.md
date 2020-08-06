---
title: "CA10: Security"
parent: Software Maturity Levels
nav_order: 455
---

# {{ page.title }}

- Minimum standard - SML1

- Expected standard - SML3

- Excellent standard - SML5

*SML1 - Initial usability:* Security was addressed in the development
phases up to and including design.
The Privacy Impact Rating (PIR) was assessed.

*SML2 - Use is feasible:* Security was addressed in the development
phases up to and including implementation.
A mitigation plan, based on the PIR, was produced.

*SML3 - Use is possible by most users:* Security was addressed in the
development phases up to and including implementation.
Developers have undertaken appropriate Security training.
The PIR mitigation plan was implemented.

*SML4 - Software is usable:* Security was addressed in the development
phases up to and including verification and testing.
The implementation of the PIR mitigation plan was verified.

*SML5 - Demonstrable usability:* Security was addressed in the
development phases up to and including product release.

## Privacy Assessment

Note that there is a requirement to assess the Privacy Impact Rating (PIR) using the following guidelines
(taken from the [Simplified Implementation of the Microsoft SDL](<https://www.microsoft.com/en-us/securityengineering/sdl/howto>)):

- *P1 High Privacy Risk. The feature, product, or service stores or
    transfers personally identifiable information (PII), changes
    settings or file type associations, or installs software.*

- *P2 Moderate Privacy Risk. The sole behaviour that affects privacy
    in the feature, product, or service is a one-time, user-initiated,
    anonymous data transfer (for example, the user clicks on a link
    and the software goes out to a Web site).*

- *P3 Low Privacy Risk. No behaviours exist within the feature,
    product, or service that affect privacy. No anonymous or personal
    data is transferred, no personally identifiable information (PII) is stored on the machine,
    no settings are changed on the user's behalf, and no software is installed.*

Note that the PIR does not directly impact the SML score.
Instead it is an indication of the amount of mitigation that needs to be put in place,
including ensuring the storage location is in accordance with EU
data protection directives (in particular GDPR).
