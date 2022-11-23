---
title: Adding a new endpoint
parent: Metadata Handling in CESSDA
nav_order: 720
---

# {{ page.title }}

This document contains information for Service Providers who want their metadata records harvested by the CESSDA Data Catalogue (CDC).
This is for Service Providers that have an online OAI-PMH repository of their study level data holdings,
and wants to make it findable via the CDC.
CDC is currently indexed by [Google Dataset Search](https://datasetsearch.research.google.com)
and is harvested by some European aggregators (such as OpenAIRE, B2Find and GoTriple).

A Basecamp space [OAI-PMH Endpoints](https://3.basecamp.com/3584575/projects/20060866) has been set up
for the dissemination of knowledge about the installation, configuration and use of Dataverse,
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

## Metadata Requirements

Data Providers must provide an endpoint exposing metadata represented as DDI 2.5 Codebook.
The DDI files must also be compliant with the [CESSDA Metadata Model (CMM)](https://zenodo.org/record/3543756).
The compliance with CMM can be checked using the [CESSDA Metadata Validator](https://cmv.cessda.eu).
We recommend validating some of your metadata to expose potential systemic issues before making your endpoint available.

Additionally, some other requirements are imposed.

- Regular updates of the metadata provided
- Deleted status when records are no longer available (see the [OAI-PMH specifications on deleted records](https://www.openarchives.org/OAI/openarchivesprotocol.html#DeletedRecords))
- Provenance records for any records not originating from this repository, i.e. aggregated from other sources
  (see the [OAI-PMH guidelines on provenance records](https://www.openarchives.org/OAI/2.0/guidelines-provenance.htm))

The CDC contains SSH study level metadata. If the repository contains (or is expected to contain) any non-SSH study level metadata,
use the [OAI-PMH Set construct](https://www.openarchives.org/OAI/openarchivesprotocol.html#Set)
to partition the metadata, so that CDC can harvest the set containing only the SSH study level metadata.

The Service Provider should have a process in place to update the XML files served by the
OAI-PMH repository on a regular basis (such as additions, modifications and deletions)
otherwise the harvested content in CDC will become stale.

If support is needed, CESSDA Service Providers can contact Main Office to connect their expert with the CESSDA Platform Team.
The following information is useful for expediating requests.

- URL of the OAI-PMH endpoint (e.g. `https://xxx.xxx.xxx/oai-pmh`)
- Metadata prefix (e.g. `oai_ddi25`)
- Set specification, if relevant (e.g. `subject:social-sciences`)
- Name and email address of the person responsible for the endpoint.
