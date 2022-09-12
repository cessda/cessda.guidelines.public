---
title: Create a Bitbucket Repository
parent: Platform Processes
grand_parent: Continuous Integration and Deployment
published: true
nav_order: 32701
---

# {{ page.title }}

## Terminology

See [Naming Conventions]({% link platform/naming-conventions.md %}).

## Instructions for members of the Platform Team

Before doing anything, you must **log in to Bitbucket using an account that has administrative privileges**.

### First decide which Bitbucket Project to put the repository in

Whichever method you choose from the ones listed below, you need to decide which Project to select when creating the repository.
Projects are used to group repositories in to sets.

The owner is always **cessda** (as per the screenshot below), but the Project is one of

|   **Project**                                           | **Key** | **Description**                                                                                |
|---------------------------------------------------------|---------|------------------------------------------------------------------------------------------------|
|                    CESSDA Architectural Guidelines      | CAG     | Guidelines for potential suppliers of software components for CESSDA's Research Infrastructure |
|                    CESSDA Data Catalogue                |   CDC   |   Components of the CESSDA Data Catalogue, see <https://datacatalogue.cessda.eu/>                |
|                    CESSDA Deprecated Repos              |   CDR   |   Holding area for deprecated repos, prior to deletion                                         |
|                    CESSDA European Question Bank        |   EQB   |   Components of the CESSDA EQB                                                                 |
|                    CESSDA IT Training                   |   CIT   |   Repos used as exemplars for how to build, test and/or deploy our tools and services          |
|                    CESSDA Knowledge Sharing Platform    |   KSP   |   Components of the Knowledge Sharing Platform                                                 |
|                    CESSDA Managed Content               |   CMC   |   Location for managed content, such as CVs, Thesauri                                          |
|                    CESSDA Metadata Validator            |   CMV   |   Used to validate ingested DDI content                                                        |
|                    CESSDA Ontology Manager              |   COM  |   Thesaurus hosting system for ELSST, running on Skosmos using Apache Jena Fuseki as the backend                        |
|                    CESSDA Operations                    |   COPS  |   Operational issues (administration of toolchain, utility scripts etc)                        |
|                    CESSDA Research Infrastructure       |   CRI   |   Infrastructure management                                                                    |
|                    CESSDA Service Portfolio Management  |   CSM   |   Tools for managing Service Portfolio management                                              |
|                    CESSDA Shared Code                     |   CSC   |   Code and code snippets, scripts, libraries etc that are thought to be of general use to Service Providers. N.B. do not put any commercial off the shelf code, or other code developed outside of CESSDA in these repositories             |
|                    CESSDA Vocabulary Service            |   CVS   |   Components of the CESSDA Vocabulary Service, see <https://vocabularies.cessda.eu/>             |
|                    SSHOC Dataverse                      |   DVS   |   Components of the SSHOC Dataverse  {% include glossary.html entry="(product)" text="product" %}                                                    |

### Specify the basic details

![New Git Repository](../images/new-git-repo.png)

### Set advanced options, as required

![Repository advanced options](../images/bitbucket-advanced-options.png)

### Do one of the following

* Create an empty repository

    If it is a *greenfield development* simply create a new repository, add a description and assign it to one of the above projects.
    See [Create a repository](<https://support.atlassian.com/bitbucket-cloud/docs/create-a-repository/>)
    for more details.

* Create a repository for existing files/projects

    If there is a project in an external location, but with just a few unversioned files in it,
    create a repository on Bitbucket and add the code to it.
    See
    [Add unversioned code to a repository](<https://support.atlassian.com/bitbucket-cloud/docs/add-unversioned-code-to-a-repository/>)
    for more details.

* Import or convert code from an existing tool

    To get code from an existing project into Bitbucket Cloud quickly from another hosting site or system,
    Bitbucket provides an importer to grab a repository. See
    [Import or convert code from
    an existing tool](<https://support.atlassian.com/bitbucket-cloud/docs/import-or-convert-code-from-an-existing-tool/>).
    for more details.

In each case, check that the [standard contents]({% link platform/gcp-repository-standard-contents.md %})
for code repositories are present (some of which can remain unchanged, others need to be edited by the code contributors).
Note that docs-as-code repositories omit the standard content files that have lowercase names.

### Set branch permissions

Add any groups that have write permission for the repository to the 'Merge via pull request' section.

![Set branch permissions](../images/branch-permissions.png)
