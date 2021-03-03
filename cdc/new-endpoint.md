---
title: Adding a new endpoint
parent: CESSDA Data Catalogue
nav_order: 720
---

# {{ page.title }}

## Audience

Service Provider staff that are concerned with making their study level metadata available via the
[CESSDA Data Catalogue](https://datacatalogue.cessda.eu).

Typical roles are systems administrator/infrastructure manager, research data manager.

## Usage

Depending on your role, you may be interested in the technical section (1) or the data-specific sections (2).
Section 3 is of general interest.

## Purpose

To provide some general guidance to Service Providers about the steps involved in setting up
and populating an OAI-PMH endpoint that can be harvested by the CESSDA Data Catalogue.
Product-specific information should be consulted as required, for e.g. installation and configuration details.

## Background

The CESSDA Data Catalogue (CDC) harvests study level metadata in DDI XML format from CESSDA Service Providers.
It has a Graphical User Interface so that researchers can search and browse
the details of tens of thousands of studies and provides a link to the associated study data in many cases.

The basic assumption is that a Service Provider has an online catalogue of their study level data holdings,
and wants to make it findable via the CDC.
CDC is currently indexed by [Google Data Search](https://datasetsearch.research.google.com)
and is expected to be harvested by some European aggregators (such as OpenAIRE and B2Find) by the end of 2021.

A Basecamp space [OAI-PMH Endpoints](https://3.basecamp.com/3584575/projects/20060866) has been set up
for the  dissemination of knowledge about the installation, configuration and use of Dataverse,
Kuha2 and other OAI-PMH applications. Access is restricted to staff of CESSDa Service Providers.

##  At a glance

* Set up an OAI-PMH endpoint (as a repository)

* Add CMM-compliant DDI XML study level metadata files

* Let CESSDA know it is available

## 1. Set up an OAI-PMH endpoint

There are several Open Source implementations of tools that support the
[OAI-PMH protocol version 2.0](http://www.openarchives.org/OAI/openarchivesprotocol.html) to choose from.

Most Service Providers use either [Dataverse](https://github.com/IQSS/dataverse/releases) or [Kuha2](https://kuha2.readthedocs.io/) and as a result some guidance and support is available from within the CESSDA community.

Some other options are listed on the [OAI-PMH tools page](https://www.openarchives.org/pmh/tools/),
however as there is no revision date shown, the list may be out of date.

The NESSTAR Server can be configured to act as an OAI-PMH repository,
but it is not recommended to use it as such, for a variety of reasons:

* NESSTAR is not being developed beyond the current version (version 4.0)

* It has some outdated dependencies (such as Java), that pose a security risk as a result

* Its performance is sub-optimal (unless placed behind a cache) when many hundreds of files are made available for harvesting

* The only DDI XML file version it supports is 1.2.2 (the most basic DDI format)

The OAI-PMH protocol supports both harvester and repository functionality.
The endpoint must be configured to act as an
[OAI-PMH repository](http://www.openarchives.org/OAI/2.0/guidelines-repository.htm).
It may also enable harvester functionality, but that is not a requirement for CDC harvesting.

Once the chosen tool has been installed and configured as an OAI-PMH repository,
it can be validated using a free to use service such as [OVAL BASE](http://oval.base-search.net).

## 2. Add study level metadata files to the repository’s document store

The CESSDA Data Catalogue can only harvest XML in either DDI 1.2.2 or DDI 2.5 format.
In either case, the DDI XML files that should be compliant with the
[CESSDA Metadata Model v1.0](https://zenodo.org/record/3543756).

DDI XML file format compliance with CMM can be checked using the [CESSDA Metadata Validator](https://cmv.cessda.eu).

If possible, the metadata prefix of the OAI-PMH repository should be set to oai_ddi (when serving DDI 1.2.2)
or oai_ddi25 (when serving DDI 2.5) for consistency with other OAI-PMH endpoints harvested by CDC.

The CDC contains SSH study level metadata.
If the repository contains (or is expected to contain) any non-SSH study level metadata,
use the [OAI-PMH Set construct](http://www.openarchives.org/OAI/openarchivesprotocol.html#Set)
to partition the metadata, so that CDC can harvest the set containing the SSH study level metadata.

The Service Provider should have a process in place to update the XML files served by the
OAI-PMH repository on a regular basis, based on changes to the records in its online catalogue
(additions, modifications, deletions), otherwise the harvested content in CDC will become stale.

## 3. Let CESSDA know it is available

Send an email to the CESSDA Platform team (support AT cessda DOT eu) containing the following information:

* URL of the OAI-PMH endpoint (e.g. https://xxx.xxx.xxx/oai-pmh)

* Metadata prefix (e.g. oai_ddi25)

* Set specification, if relevant (e.g. subject:social-sciences)

* Name and email address of the person responsible for the endpoint,
    in case there are any problems with harvesting it.
