---
title: Naming Conventions
parent: Technical Infrastructure
nav_order: 305
---

# {{ page.title }}

The naming conventions for products are designed to increase consistency across documentation and between the development,
staging and production deployments with the aim of increasing the {% include glossary.html entry="(usability)" text="usability" %}
of the build, test and deployment scripts.

## Abbreviations

- CDC: [CESSDA Data Catalogue](https://datacatalogue.cessda.eu/)
- CVS: [CESSDA Vocabulary Service](https://vocabularies.cessda.eu/)
- DVS: Dataverse
- ELSST: [European Language Social Science Thesaurus](https://elsst.cessda.eu/)
- EQB: European Question Bank
- GCP: [Google Cloud Platform](https://cloud.google.com)
- GKE: [Google Kubernetes Engine](https://console.cloud.google.com/kubernetes/)

## Definitions

- See {% include glossary.html entry="Glossary" %}
- See also [Kubernetes definitions](https://kubernetes.io/docs/concepts/overview/components/)
- See also [Google Cloud overview](https://cloud.google.com/docs/overview/)

## Workloads and Services

Workloads and services/ingress names generally follow the same pattern and are composed of two parts.
The prefix is the lowercase  {% include glossary.html entry="(product)" text="product" %} name abbreviation (e.g. `cdc-`, `cvs-`, `dvs-`, `eqb-`)
or lowercase functional abbreviation (`mgmt-`, `monitoring-`). The main part is the name of
the  {% include glossary.html entry="(component)" text="component" %} (e.g. `certbot`, `mailrelay`, `reverse`, `osmh-indexer`).

So the pattern looks like this

- Management tools: `mgmt-${component_name}` (e.g. `mgmt-certbot`, `monitoring-prometheus`)
- CDC: `cdc-${component_name}` (e.g. `cdc-osmh-indexer`)
- CVS: `cvs-${component_name}` (e.g. `cvs-reverse`)
- DVS: `dvs-${component_name}` (e.g. `dvs-mailrelay`)
- EQB: `eqb-${component_name}` (e.g. `eqb-frontend`)

## Namespaces

Namespaces are used to group the components of a  {% include glossary.html entry="(product)" text="product" %}
within a cluster, whist isolating them from components of other products.
Namespaces are named for the  {% include glossary.html entry="(product)" text="product" %} they contain,
in the form of `${product_name}`, e.g. `cdc`, `cvs`, `dvs`, `eqb`, `monitoring`.
The exception to this is management tools, which for historical reasons use the `cessda-mgmt` namespace.
So a cluster typically has multiple namespaces.

## Clusters

Clusters are named to reflect the various deployment environments. Simple names are used, using the template `${environment}-cluster`.
The cluster names chosen are:

- `development-cluster`
- `staging-cluster`
- `production-cluster`
- `management-cluster`

## Storage / Persistent Volume Claims

Names of persistent volumes track the names of the tools that they serve using the template `${product_name}-${component_name}-pvc`.
If multiple volumes are used, the naming convention `${product_name}-${component_name}-${function}-pvc` is used.

The naming conventions of persistent volumes managed by stateful sets are defined by
[Kubernetes](https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/#volume-claim-templates).

## Configuration / Secrets

Names of ConfigMaps and Secrets are of the form `${product_name}-${component_name}-configmap` and `${product_name}-${component_name}-secret`.

## Subdomains

Subdomains are in the form of `${subdomain}.cessda.eu`. The subdomain is not the same as the `${product_name}`,
i.e. for the CESSDA Data Catalogue the subdomain is `datacatalogue`, whereas the `${product_name}` is `cdc`.

For development and staging environments, the `${subdomain}` has `-dev` or `-staging` appended (e.g. `datacatalogue-dev.cessda.eu`).
