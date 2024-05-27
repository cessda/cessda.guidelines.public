---
title: Operational Documentation
parent: Documentation Guidelines
grand_parent: Software Development
published: true
nav_order: 1802
---
# {{ page.title }}

## Purpose

Provide guidance for CESSDA Product Technical Contacts, developers of other CESSDA software
and members of the Main Office Platform Team so they know what is expected of them
with respect to producing operational documentation.

It should be read in conjunction with the SML requirement
[CA1.2](https://docs.tech.cessda.eu/sml/ca1-documentation.html#ca12-operational-documentation).

## Deployment and configuration manual

### General requirements

- Ensure that the content  is directly related to the current version of the product
- Clearly state the version number of the documentation, which should match the current version of the product
- Optionally add a date (month and year is sufficient)
- State the license of the content of the documentation
    (use [Creative Commons Attribution 4.0 International](https://creativecommons.org/licenses/by/4.0/)
    unless there is a very good reason not to)
- Include a glossary and define any abbreviations and specialised terms.

### Specific requirements

- Deployment instructions
- Management instructions
- Configurations options (with examples), and location of configuration files
  - see also 12 factor app, number 3 [Config - Store config in the environment](https://12factor.net/config))
- Confirmation that relevant application logs are written to STDOUT.
- List of all exception message (excluding system and 3rd party module messages
    which should be detailed elsewhere by their authors), with explanations if they are not self-explanatory
- List of all failure message (excluding system and 3rd party module messages
    which should be detailed elsewhere by their authors), with explanations if they are not self-explanatory.
