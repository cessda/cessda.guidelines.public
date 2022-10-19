---
title: URN Handling and Resolution
parent: Metadata Handling in CESSDA
nav_order: 730
---

# {{ page.title }}

## General Information

CESSDA uses URNs, as required by the DDI standards. The URN agency and sub-agencies are registered at the [DDI Agency Registry](https://registry.ddialliance.org/Agency?agencyName=int.cessda).

CESSDA does not provide URN resolution and there is currently no central resolver.

We have several sub-agencies for the various services

* `int.cessda.cv` - CESSDA owned vocabularies, *not* the service
* `int.cessda.elsst` - ELSST Thesaurus
* `int.cessda.eqb` - EQB

## CVS

* Content hosted using CVS is canonically exposed with a URN

## ELSST

ELSST's canonical URLs are resolved to the Skosmos instance using redirects.
Every concept has a unique identifier which is mapped using the URI template.

* URN form: `urn:ddi:int.cessda.elsst:{uuid}:{version}`
* URI form: `https://elsst.cessda.eu/id/{uuid}` for the latest, `https://elsst.cessda.eu/id/{version}/{uuid}`

Versions are written as an ascending number, e.g. 1, 2, 3.
We do not have a way to resolve versions at the moment.

The form to use in the SKOS representation matches the URI form, with `dc:isVersionOf` set to the versionless/latest identifier
for each concept. For the root the ID is `https://elsst.cessda.eu/id/3/` with `dc:isVersionOf` set to `https://elsst.cessda.eu/id/`.
