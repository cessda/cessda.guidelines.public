---
title: Adding a new endpoint
parent: Metadata Handling in CESSDA
nav_order: 720
---

# {{ page.title }}

This document offers essential guidance for Service Providers and relevant
third-party entities interested in having their metadata records incorporated
into the CESSDA Data Catalogue (CDC).It is particularly applicable to those
with an online OAI-PMH (Open Archives Initiative Protocol
for Metadata Harvesting) repository showcasing their study-level data holdings.
The objective is to enhance the discoverability of these data holdings through
the CDC.

Notably, the CDC is indexed by
[Google Dataset Search](https://datasetsearch.research.google.com)
and collaborates with several European data aggregators, including
[OpenAIRE](https://explore.openaire.eu/), [B2Find](https://b2find.eudat.eu/),
and [GoTriple](https://gotriple.eu/), for metadata harvesting.

A Basecamp space
[OAI-PMH Endpoints](https://3.basecamp.com/3584575/projects/20060866)
has been set up for the dissemination of knowledge about the installation,
configuration and use of Dataverse, Kuha2 and other OAI-PMH applications.
Access is restricted to staff of CESSDA Service Providers.

## Set up an OAI-PMH endpoint

There are several Open Source implementations of tools that support the
[OAI-PMH version 2.0](https://www.openarchives.org/OAI/openarchivesprotocol.html)
to choose from.

Most Service Providers use either
[Dataverse](https://github.com/IQSS/dataverse/releases)
or [Kuha2](https://kuha2.readthedocs.io/) and as a result some guidance and
support is available from within the CESSDA community. Support for NESSTAR has
ended and should be replaced. CESSDA will not ingest NESSTAR repositories.

Some other options are listed on the
[OAI-PMH tools page](https://www.openarchives.org/pmh/tools/),
however as there is no revision date shown, the list may be out of date.

The endpoint must be configured to act as an
[OAI-PMH repository](https://www.openarchives.org/OAI/2.0/guidelines-repository.htm).
Once the chosen tool has been installed and configured,
it can be validated using a free to use service such as
[OVAL BASE](https://oval.base-search.net).

## Metadata Requirements

Service (Data) Providers must provide an endpoint exposing metadata represented
as DDI 2.5 Codebook standard. Looking ahead, the CDC is set to expand its
support to include the DDI Lifecycle format,furthering enhancing its
metadata handling capabilities. The DDI files must also be compliant with the
latest version of
[CESSDA Metadata Model (CMM)](https://zenodo.org/records/7528240).
The compliance with CMM can be checked using the
[CESSDA Metadata Validator](https://cmv.cessda.eu). **We recommend validating**
**some of your metadata to expose potential systemic issues before making**
**your endpoint available.**

Additionally, some other requirements are imposed.

- Regular updates of the metadata provided
- Deleted status when records are no longer available (see the
[OAI-PMH specifications on deleted records](https://www.openarchives.org/OAI/openarchivesprotocol.html#DeletedRecords))
- Provenance records for any records not originating from this repository,
i.e. aggregated from other sources (see the
[OAI-PMH guidelines on provenance records](https://www.openarchives.org/OAI/2.0/guidelines-provenance.htm))

The CDC contains SSH study level metadata. If the repository contains
(or is expected to contain) any non-SSH study level metadata, use the
[OAI-PMH Set construct](https://www.openarchives.org/OAI/openarchivesprotocol.html#Set)
to partition the metadata, so that CDC can harvest the set containing only the
SSH study level metadata.

It is essential for Service Providers to establish and maintain a routine
process for updating the XML files hosted by their OAI-PMH repositories. This
includes regular updates for additions, modifications, and deletions
of content. Without such a maintenance protocol, the data harvested in the
CESSDA Data Catalogue (CDC) risks becoming outdated and may no longer reflect
the most current and accurate information

If support is needed, Service (Data) Providers can contact CESSDA Main Office
to connect their expert with the CESSDA Platform Team.
The following information is useful for expediating requests.

- URL of the OAI-PMH endpoint (e.g. `https://xxx.xxx.xxx/oai-pmh`)
- Metadata prefix (e.g. `oai_ddi25`)
- Set specification, if relevant (e.g. `subject:social-sciences`)
- Name and email address of the person responsible for the endpoint.
