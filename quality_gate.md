# CESSDA Quality Gate

The CESSDA build pipeline uses [SonarQube](https://sonarqube.cessda.eu) to check the quality of software before it is deployed.

A software build will fail the quality gate and deployment will not take place if any of the following conditions are met:


- Coverage on New Code is less than 80.0% 
- Duplicated Lines on New Code is greater than	3.0%
- Maintainability Rating on New Code	is worse tha A
- Reliability Rating on New Code	is worse than A
- Security Rating on New Code	is worse than	A




### Maintainability Rating
 

If the estimated time required to fix security and reliability issues is:

- <=5% of the time that has already gone into the application, the rating is A
- between 6 to 10% the rating is a B
- between 11 to 20% the rating is a C
- between 21 to 50% the rating is a D
- anything over 50% is an E


### Reliability Rating

How buggy is the code?


- A = 0 Bugs
- B = at least 1 Minor Bug
- C = at least 1 Major Bug
- D = at least 1 Critical Bug
- E = at least 1 Blocker Bug


### Security Rating

How secure is the code?
 
- A = 0 Vulnerabilities
- B = at least 1 Minor Vulnerability
- C = at least 1 Major Vulnerability
- D = at least 1 Critical Vulnerability
- E = at least 1 Blocker Vulnerability



See SonarQube [metric definitions](https://sonarqube.cessda.eu/documentation/user-guide/metric-definitions) for further details.