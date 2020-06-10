---
title: Quality Gate
layout: page
parent: Software Development
nav_order: 030
---

# CESSDA Quality Gate

The following criteria define the CESSDA quality gate.

- Code Test Coverage is at least 80.0%
- Duplicated Code Lines is less than 3.0%
- Maintainability Rating is A
- Reliability Rating is A
- Security Rating is A

## Ratings

### Maintainability

If the estimated time required to fix security and reliability issues is:

- <=5% of the time that has already gone into the application, the rating is A
- between 6 to 10% the rating is a B
- between 11 to 20% the rating is a C
- between 21 to 50% the rating is a D
- anything over 50% is an E

### Reliability

How buggy is the code?

- A = 0 Bugs
- B = at least 1 Minor Bug
- C = at least 1 Major Bug
- D = at least 1 Critical Bug
- E = at least 1 Blocker Bug

### Security

How secure is the code?

- A = 0 Vulnerabilities
- B = at least 1 Minor Vulnerability
- C = at least 1 Major Vulnerability
- D = at least 1 Critical Vulnerability
- E = at least 1 Blocker Vulnerability

## Implementation

CESSDA currently uses [SonarQube](https://sonarqube.cessda.eu) to automatically calculate these values and ratings.
See [SonarQube metric definitions](https://sonarqube.cessda.eu/documentation/user-guide/metric-definitions/) for further details.

Checks are performed on each pipeline build.
A software build of a new commit will fail and prevent deployment, if the quality gate is not reached for new code in that commit.

