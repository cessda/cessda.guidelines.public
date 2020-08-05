---
title: Naming Conventions
parent: Technical Infrastructure
nav_order: 305
---

# {{ page.title }}

The naming conventions for products are designed to increase consistency across documentation and between the development,
 staging and production deployments with the aim of increasing the {% include glossary.html entry="usability" %} of the build,
 test and deployment scripts.

## Abbreviations

- CDC: [CESSDA Data Catalogue](<https://datacatalogue.cessda.eu/>)

- CVS: [CESSDA Vocabulary Service](<https://vocabularies.cessda.eu/#!discover>)

- DVS: Dataverse

- ELSST: [European Language Social Science Thesaurus](<https://elsst.ukdataservice.ac.uk/>)

- EQB: European Question Bank

- GCP: [Google Cloud Platform](<https://cloud.google.com>)

- GKE: [Google Kubernetes Engine](<https://console.cloud.google.com/kubernetes/>)

## Definitions

- See {% include glossary.html entry="Glossary" %}

- See also [Kubernetes  {% include glossary.html entry="component" %} definitions](https://kubernetes.io/docs/concepts/overview/components/)

- See also [GCP concepts](https://cloud.google.com/docs/overview/)

## Cluster, Workload and Service Names

### GCP cluster names

The prefix `development-`, `management-`, `staging-` or `production-` is used with `cluster` to form the cluser name, e.g. `staging-cluster`.

### Workload and Service/Ingress names

Workloads and services/ingress names generally follow the same pattern and are composed of two parts.
The prefix is the lowercase  {% include glossary.html entry="product" %} name abbreviation (e.g. `cdc-`, `cvs-`, `dvs-`, `eqb-`)
or lowercase functional abbreviation (`mgmt-`, `monitoring-`). The main part is the name of
the  {% include glossary.html entry="component" %} (e.g. `certbot`, `mailrelay`, `reverse`, `osmh-indexer`).

So the pattern looks like this

- Management tools: mgmt-$component_name (e.g. `mgmt-certbot`, `monitoring-prometheus`)

- CDC: cdc-$component_name (e.g. `cdc-osmh-indexer`)

- CVS: cvs-$component_name (e.g. `cvs-reverse`)

- DVS: dvs-$component_name (e.g. `dvs-mailrelay`)

- EQB: eqb-$component_name (e.g. `eqb-frontend`)

## Namespaces

Namespaces are used to group the components of a  {% include glossary.html entry="product" %} within a cluster, whist isolating them from components of other products.
 Namespaces are named for the  {% include glossary.html entry="product" %} they contain, in the form of $product_name, e.g. `cdc`, `cvs`, `dvs`, `eqb`, `mgmt`,
  `monitoring`. So a cluster typically has multiple namespaces.

## Clusters

Clusters are named to reflect the various deployment environments. Simple names are used, using the template $environment-cluster.
 The cluster names chosen are:

- `development-cluster`

- `staging-cluster`

- `production-cluster`

- `management-cluster`

## Storage / Persistent Volume Claims

Names of persistent volumes track the names of the tools that they serve using the template *$product_name-$component_name-pvc*.

## Configuration / Secrets

Names of ConfigMaps and Secrets are of the form *$product_name-$component_name-configmap* and *$product_name-$component_name-secret*.

## Subdomains

Subdomains are in the form of *$subdomain.cessda.eu*. The subdomain is not the same as the $product_name,
i.e. for the CESSDA Data Catalogue the subdomain is `datacatalogue`, whereas the $product_name is `cdc`.

For development and staging environments, the $subdomain has `-dev` or `-staging` appended (e.g. `datacatalogue-dev`).
