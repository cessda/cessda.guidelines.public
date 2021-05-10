---
title: Development documentation
parent: Software Development Guidelines
grandparent: Software Development
published: true
nav_order: 1803
---
# {{ page.title }}

## Purpose

Provide guidance for CESSDA Product Technical Contacts and developers of other CESSDA software,
so they know what is expected of them with respect to producing technical documentation.

It should be read in conjunction with the [CESSDA Technical Guidelines](https://docs.tech.cessda.eu) in general,
and both the
[Standard Git Repository Contents section](https://docs.tech.cessda.eu/platform/gcp-repository-standard-contents.html)
and the SML requirement
[CA1.3](https://docs.tech.cessda.eu/sml/ca1-documentation.html#ca13-development-documentation)
in particular.

## Technical manual

### General requirements

* Ensure that the content  is directly related to the current version of the product

* Clearly state the version number of the documentation, which should match the current version of the product

* Optionally add a date (month and year is sufficient)

* State the license of the content of the documentation
    (use Creative Commons Attribution 4.0 International unless there is a very good reason not to)

* Include a glossary and define any abbreviations and specialised terms.

### Specific requirements

* API documentation
  * Use of Swagger is mandated.

* {% include glossary.html entry="HCI" text="HCI" %} documentation
  * Exclude any system configuration options and items covered by the User manual;
  * Clarify any deviations from the CESSDA User Experience guide;
  * Model used (single page application, other);
  * Implementation details (libraries, frameworks etc).

* Code modules (in the case of a microservice-based architecture module=container)
  * Name them;
  * Specify the purpose of each one;
  * Identify the code repository for each one;
  * Provide a high level architecture diagram.

* Extension guide
  * Give one or more examples of how to extend modules to
      e.g. use a different protocol to communicate with external systems;
  * emit or ingest data in additional formats.

* Source code documentation
  * Use de facto standard for chosen language, e.g: JavaDoc for Java;
  * Program flow: interaction between components. Diagram(s) preferred;
  * Program logic: say what happens when a process is triggered e.g. End User interacts with
      {% include glossary.html entry="HCI" text="HCI" %};
  * End to end descriptions of the implementation of each of the Use Cases.
