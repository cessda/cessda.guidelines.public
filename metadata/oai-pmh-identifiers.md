---
title: CESSDA OAI-PMH Identifiers Specification
parent: Metadata Handling in CESSDA
nav_order: 710
---

# {{ page.title }}

Identifiers are defined as

```bash
sha256(${OAI-PMH Endpoint URL}-${OAI-PMH Identifier})
```

The OAI-PMH endpoint URL is defined as the canonical URL as identified in the OAI-PMH request element. The XPath to the element is `/OAI-PMH/request`.

The OAI-PMH identifier is defined as the identifier present in the header element of the record. The XPath to the element is `//record/header/identifier`.

The concatenated string must be encoded using UTF-8 and have no newline (`/n`) or other whitespace characters.
The resulting hash must be represented as a string using hexadecimal notation.

Example from UKDS:

```xml
<request identifier="6" metadataPrefix="ddi" verb="GetRecord">https://oai.ukdataservice.ac.uk:8443/oai/provider</request>
<GetRecord>
  <record>
    <header>
      <identifier>6</identifier>
      <datestamp>2020-02-13T17:47:04Z</datestamp>
      <setSpec>DataCollections</setSpec>
    </header>
...
```

The SHA-256 of `https://oai.ukdataservice.ac.uk:8443/oai/provider-6` is `93d5bf21cc7e9ae1463816f848be9d46067f1302eb8b4fab8ef102ff485aefaa`

Example from FSD:

```xml
<request identifier="oai:fsd.uta.fi:FSD1028" metadataPrefix="oai_ddi25" verb="GetRecord">https://services.fsd.tuni.fi/v0/oai</request>
  <GetRecord>
    <record>
    <header>
      <identifier>oai:fsd.uta.fi:FSD1028</identifier>
      <datestamp>2022-03-17T10:20:08Z</datestamp>
      <setSpec>language:fi</setSpec>
      <setSpec>language:en</setSpec>
      <setSpec>study_groups:yks</setSpec>
      <setSpec>data_kind:Kvantitatiivinen</setSpec>
      <setSpec>data_kind:Quantitative</setSpec>
      <setSpec>openaire_data</setSpec>
    </header>
...
```

The SHA-256 of `https://services.fsd.tuni.fi/v0/oai-oai:fsd.uta.fi:FSD1028` is `b9fd25c481a1d74b6d1b1a5fb55116034fcdd9bddd789c38548815423801579a`
