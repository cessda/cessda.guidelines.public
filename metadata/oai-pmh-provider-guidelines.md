---
title: Adding a new endpoint
parent: Metadata Handling in CESSDA
nav_order: 720
---

# {{ page.title }}

## Audience

Service Provider staff that are concerned with making their study level metadata available via the
[CESSDA Data Catalogue](https://datacatalogue.cessda.eu).

## Purpose

To provide some general guidance to Service Providers about the steps involved in setting up
and populating an OAI-PMH endpoint that can be harvested by the CESSDA Data Catalogue.
Product-specific information should be consulted as required, for e.g. installation and configuration details.

## Background

The basic assumption is that a Service Provider has an online catalogue of their study level data holdings,
and wants to make it findable via the CDC.
CDC is currently indexed by [Google Data Search](https://datasetsearch.research.google.com)
and is harvested by some European aggregators (such as OpenAIRE and B2Find).

A Basecamp space [OAI-PMH Endpoints](https://3.basecamp.com/3584575/projects/20060866) has been set up
for the  dissemination of knowledge about the installation, configuration and use of Dataverse,
Kuha2 and other OAI-PMH applications. Access is restricted to staff of CESSDA Service Providers.

## Set up an OAI-PMH endpoint

There are several Open Source implementations of tools that support the
[OAI-PMH protocol version 2.0](https://www.openarchives.org/OAI/openarchivesprotocol.html) to choose from.

Most Service Providers use either [Dataverse](https://github.com/IQSS/dataverse/releases)
or [Kuha2](https://kuha2.readthedocs.io/)
and as a result some guidance and support is available from within the CESSDA community.
Support for NESSTAR has ended and should be replaced. CESSDA will not ingest NESSTAR repositories.

Some other options are listed on the [OAI-PMH tools page](https://www.openarchives.org/pmh/tools/),
however as there is no revision date shown, the list may be out of date.

The endpoint must be configured to act as an
[OAI-PMH repository](https://www.openarchives.org/OAI/2.0/guidelines-repository.htm).
Once the chosen tool has been installed and configured,
it can be validated using a free to use service such as [OVAL BASE](https://oval.base-search.net).

## Add study level metadata files to the repository's document store

The CESSDA Data Catalogue can only harvest XML in DDI 2.5 format.
Additionally, the DDI XML files should be compliant with the
[CESSDA Metadata Model v1.0](https://zenodo.org/record/3543756).

DDI XML file format compliance with CMM can be checked using the [CESSDA Metadata Validator](https://cmv.cessda.eu).
We recommend validating some of your metadata to expose potential systemic issues before making your endpoint available.

The CDC contains SSH study level metadata.
If the repository contains (or is expected to contain) any non-SSH study level metadata,
use the [OAI-PMH Set construct](https://www.openarchives.org/OAI/openarchivesprotocol.html#Set)
to partition the metadata, so that CDC can harvest the set containing only the SSH study level metadata.

The Service Provider should have a process in place to update the XML files served by the
OAI-PMH repository on a regular basis, based on changes to the records in its online catalogue
(additions, modifications, deletions), otherwise the harvested content in CDC will become stale.
