# Navigation Structure of CESSDA Technical Guidelines

This is the record of how the various sections are structured,
and should be used by developers for reference, and updated when new pages are added.

It is not intended for publication.

The numbers in parenthesis refer to the nav_order value which is set in the header of each page.

The indentation is intended to indicate major sections, subsections and sub-subsections.

```none
(000) Home

(100) Software Development
  (110) Software Requirements
  (120) Infrastructure Compatibility
  (130) Quality Gate
  (140) Software Releases
    (1041) Software Publication
  (150) Issue Tracking Workflow
  (160) Code Archiving
  (170) Logging Guidelines
  (180) Software Development Guidelines
    1801 End User documentation
    1802 Operational documentation
    1803 Development documentation
    1804 Merging and pull requests

(200) Service Operation
  (210) Service Requirements
  (220) Service Objectives

(300) Technical Infrastructure
  (301) Documentation Tooling
  (305) Naming Conventions
  (310) Technical Architecture
    (3101) Common Interoperability Characteristics
    (3102) Future Work (not published)
    (3103) Enhancing the Technical Architecture (not published)
  (315) Technical Infrastructure Overview
  (320) GCP Main Project Structure
  (325) Deployment Pipeline Overview
  (330) Deployment Workflow
  (335) Deployment Pipeline Details
  (336) The CESSDA Branching Model for Deployments
  (345) Using Helm to deploy products
  (350) Technical Infrastructure Details
  (355) Building Maven Projects with Jenkins
  (360) Building Docker Images on Jenkins
    (3601) Adding the Build Jenkinsfile
    (3602) Adding the Deployment Jenkinsfile
  (365) Building with Docker
  (370) Platform Team Responsibilities
    (3701) Create a Bitbucket Repository
    (3702) Standard Git Repository Contents
    (3703) Create a New Jenkins Job
    (3704) Creating a Test Suite
  (375) Updating CI Tools
  (380) Jenkinsfile Template
  (385) Jenkinsfile Template for JDK11 Maven Projects
  (390) Setup and Configure oauth2-proxy
  (391) Rate limiting with HAProxy
  (392) Authenticating with EduTeams

(400) Software Maturity Levels
  (410) CA1: Documentation
  (415) CA2: Intellectual Property
  (420) CA3: Extensibility
  (425) CA4: Modularity
  (430) CA5: Packaging
  (435) CA6: Portability
  (440) CA7: Standards Compliance
  (445) CA8: Maintenance
  (450) CA9: Verification and Testing
  (455) CA10: Security
  (460) CA11: Internationalisation and Localisation
  (465) CA12: Authentication and Authorisation
  (492) References
  (493) Version History (not published)
  (494) Document Details/Title Page (not published)

(500) Observability
  (510) Monitoring Overview
  (520) Logging Overview

(600) Online forms
  (610) Contributor license agreement
  (620) Repository request
  (630) Software Maturity Levels
  (640) ELSST contributor license agreement

(700) Metadata Handling in CESSDA
  (710) CESSDA OAI-PMH Identifiers Specification
  (720) Adding a new endpoint
  (730) URN Handling and Resolution
  (740) Versioning for CVS and ELSST

(998) Glossary
```
