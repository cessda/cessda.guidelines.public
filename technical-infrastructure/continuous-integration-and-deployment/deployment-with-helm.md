---
title: Using Helm to deploy products
parent: Continuous Integration and Deployment
grand_parent: Technical Infrastructure
---

# {{ page.title }}

## Terminology

See [Naming Conventions]({% link technical-infrastructure/naming-conventions.md %}).

## An Overview

CESSDA uses Kubernetes to deploy and orchestrate containers running on Google
Cloud. Previously we used manually written scripts to manage deployments,
now we use [Helm charts](https://helm.sh/docs/topics/charts/).

### Drawbacks with deployment scripts

The scripts substituted variables into template Kubernetes manifests, then
applied them with `kubectl apply`. While an easy approach to implement, issues
arose when applications had multiple components as it required large amounts of
copy and pasting and deployment couldn’t be validated locally.
This resulted in large time investments debugging these templates.

### Why wasn't Helm adopted sooner?

Before Helm 3, a server-side  {% include glossary.html entry="(component)" text="component" %} called Tiller was needed to communicate
with the cluster. Many commentators said that there were security flaws with this approach.
With the removal of Tiller, access permissions are managed using the standard Kubernetes tools.

## The layout of a CESSDA Helm chart

CESSDA uses a meta-chart model to construct Helm charts.
For an application like CDC, the top-level chart is named after the application and has no templates in it.

Charts for individual components are stored in the *charts* directory of the main chart.
These charts are named directly after the components (i.e. es, Searchkit).
This allows charts to be developed independently so that components can be deployed individually.

* Root Chart
  * Component 1
  * Component 2
  * Etc.

## How CESSDA charts are deployed

Deployments on the CESSDA Technical Infrastructure use atomic
deployments.
This approach tries to ensure that if deployments do not start,
either because of bugs or misconfiguration, the deployment will
automatically roll back to a known good state.

All components of the chart are deployed together.
Optional components can be enabled or disabled using a variable specified
in the `values.yaml` file (typically of the form `enabled: true`).

Before deployment, Kubernetes manifests are validated using `kube-score` which
checks that they follow best practices.

An existing  {% include glossary.html entry="(product)" text="product" %}
deployment can be rolled back to a specified previous version, using a Jenkins
job `cessda.xxx.rollback` (where 'xxx' is replaced with the
{% include glossary.html entry="(product)" text="product" %} code, e.g. `cdc`, `eqb`)
