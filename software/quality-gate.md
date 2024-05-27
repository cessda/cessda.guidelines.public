---
title: Quality Gate
parent: Software Development
nav_order: 130
---

# {{ page.title }}

CESSDA uses [SonarQube](https://sonarqube.cessda.eu) to automatically calculate metrics relating to software quality.
These checks are performed on each pipeline build of the `main` branch of a source code repository.
Passing the quality gate is a requirement for any [release]({% link software/releases.md %}).

The following criteria define the CESSDA quality gate.

- Code Test Coverage is at least 80.0%
- Duplicated Code Lines is less than 3.0%
- Maintainability Rating is A
- Reliability Rating is A
- Security Rating is A

## Ratings

### Maintainability

Estimates the time needed to "clean" the code by refactoring technical debt and confusing code constructs.

If the estimated time required to fix security and reliability issues is:

- <=5% of the time that has already gone into the application, the rating is A
- between 6 to 10% the rating is a B
- between 11 to 20% the rating is a C
- between 21 to 50% the rating is a D
- anything over 50% is an E

### Reliability

Measures the count of suspected bugs in the code.

- A = 0 Bugs
- B = at least 1 Minor Bug
- C = at least 1 Major Bug
- D = at least 1 Critical Bug
- E = at least 1 Blocker Bug

### Security

Discovers common mistakes that can lead to security vulnerabilities.

- A = 0 Vulnerabilities
- B = at least 1 Minor Vulnerability
- C = at least 1 Major Vulnerability
- D = at least 1 Critical Vulnerability
- E = at least 1 Blocker Vulnerability

## Further Reading

See [SonarQube quality gates](https://sonarqube.cessda.eu/documentation/user-guide/quality-gates/) for an overview on quality gates.  
See [SonarQube metric definitions](https://sonarqube.cessda.eu/documentation/user-guide/metric-definitions/) for further details on how the metrics are defined.
