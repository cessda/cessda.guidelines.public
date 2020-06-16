---
title: GCP Main Project Structure
layout: page
parent: Platform
nav_order: 303
---

# GCP Main Project Structure

## Terminology

See [Naming Conventions](NamingConventions.md).

## Overview

The diagram shows the top-down decomposition of the GCP Projects CESSDA Development and CESSDA Production.

### CESSDA Development GCP Project

The Development project contains two Kubernetes clusters, `development-cluster` and `staging-cluster`.

The `development-cluster` contains the components of the  CDC, CVS, DVS and EQB tools plus some monitoring and management services. They are separated within the cluster by various namespaces (`cdc`, `cvs`, `dvs`, `eqb`, `mgmt`, `monitoring`).

![GCPMainProjectStructureDevelopment](images/GCPMainProjectStructureDevelopment.png)

For a better view [download](images/GCPMainProjectStructureDevelopment.png) the file.

The `staging-cluster` contains the components of the  CDC, CVS, DVS and EQB tools plus some monitoring and management services. They are separated within the cluster by various namespaces (`cdc`, `cvs`, `dvs`, `eqb`, `mgmt`, `monitoring`).

![GCPMainProjectStructureStaging](images/GCPMainProjectStructureStaging.png)

For a better view [download](images/GCPMainProjectStructureStaging.png) the file.

### CESSDA Production GCP Project

The Production project contains two Kubernetes clusters, `production-cluster` and `management-cluster`.

The `production-cluster` contains the components of the CDC, CVS, DVS and EQB tools plus some monitoring services. They are separated within the cluster by various namespaces (`cdc`, `cvs`, `dvs`, `eqb`, `mgmt`, `monitoring`).

![GCPMainProjectStructureProduction](images/GCPMainProjectStructureProduction.png)

For a better view [download](images/GCPMainProjectStructureProduction.png) the file.

For editable versions of the above Figures, see [GCP_Deployment_Environments](https://drive.google.com/open?id=19mvvuG70WCL1IW5HUpMRNnZMzXWRBFzP)
