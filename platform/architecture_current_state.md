---
title: Current State of the Infrastructure
parent: Technical Architecture
grand_parent: Technical Infrastructure
published: false
nav_order: 3105
---

# {{ page.title }}

At the date of publication of this version of the Technical Architecture document,
the CESSDA development infrastructure consists of the following components:

- A set of Bitbucket repositories containing documentation for
    developers and administrators, relating to various topics,
    including how to gain access to the source code repositories,
    how to grant access to the source code repositories, technical
    guidelines for API development, and documentation templates.
    These are grouped together as the [CESSDA Architectural Guidelines
    project](https://bitbucket.org/account/user/cessda/projects/CAG).

- A set of Bitbucket repositories containing source code for various RI components.
    Each components is allocated one or more repositories, with new ones created on demand.
    These are grouped together as the [CESSDA Research Infrastructure
    project](https://bitbucket.org/account/user/cessda/projects/CRI).
    The current repositories are for the metadata harvester and associated handlers.

- A Jenkins job for each repository, which is called by a post-commit hook

- An issue tracker for each repository (within the Bitbucket environment).

- A wiki for selected repositories (within the Bitbucket environment).

In addition, the cloud-based services listed below have all been set up.
This is to ease sharing and/or transfer of administration rights between individuals,
as no personal data is associated with the accounts, and all service notifications are sent to the same inbox.

| Type                              | Description                                                                                                                       | System (see above)                 | Location                                         |
|-----------------------------------|-----------------------------------------------------------------------------------------------------------------------------------|------------------------------------|--------------------------------------------------|
| Collaborative document management | Multi-author environment with change tracking, for non-source code file types, such as documents, spreadsheets and presentations. | Google Drive                       | <https://drive.google.com>                         |
| DVCS/SCM                          | Distributed version control system - repositories for storing and sharing source code.                                            | Bitbucket (Git repositories)       | <https://bitbucket.org>                            |
| File storage                      | Linkable/embeddable storage option for non-source code file types, such as documents, spreadsheets and presentations.             | Google Drive                       | <https://drive.google.com>                         |
| Email                             | Email account to use as primary contact for all other accounts. Can be used as OpenId style login credentials for other accounts. | Gmail                              | <https://mail.google.com>                          |
| Code execution environment        | Spin up containers/VMs and deploy code on demand. Execute                                                                         | Google Cloud Platform              | <https://cloud.google.com>                         |
| Chatroom                          | Set up open or closed topic-specific discussion spaces, e.g. developer community (closed) and user community (open).              | Slack                            | <https://cessda.slack.io>            |
| Issue Tracker                     | Create and manage source code-specific discussions and (technical) details.                                                       | Per repository option in Bitbucket | <https://bitbucket.org>                            |
| Wiki                              | Create and manage source code-specific discussions and (technical) details.                                                       | Per repository option in Bitbucket | <https://bitbucket.org>                            |
| CI Server                         | Continuous Integration server, runs build and test jobs against source code repositories.                                         | Jenkins                            | Hosted on Google Cloud Platform                  |
| CIT                               | Continuous Integration and Testing environment. Requires a CI server, an execution environment  and various build and test tools. | Combination of services            | See details for each component service           |
| System Availability Monitor       | Periodically check (24/7) that web site or other <http(S) service is available                                                     | Uptime Robot                       | <https://uptimerobot.com>/                         |
| Avatar                            | Some form of ‘identity’ to associate with the CessdaTechFrame account                                                             | Gravatar                           | <https://en.gravatar.com>                          |
| Microservice registry             | Similar concept to GitHub etc - version control and access/sharing for containers                                                 | Docker Hub, Google Cloud Platform  | <https://hub.docker.com>/ <https://cloud.google.com> |

## Service Integration

There are a number of links between components of the development environment, as detailed below.
These typically ensure that a change made to one is automatically reflected in the other.

| From      | To        | Purpose                                                                                                          | In place?                                                                                             |
|-----------|-----------|------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------|
| Bitbucket | HipChat   | Post repository events to associated chat room (alternative to email notifications). Event list is configurable. | Yes*  [* done on per repository/room combination, so needs to be configured for each new repository.] |
| Bitbucket | Jenkins   | Post commit hook - trigger a build when content of repository is updated.                                        | Yes* [* done on per repository/job combination, so needs to be configured for each new repository.]   |
| Jenkins   | Bitbucket | Checkout code from one or more repositories (for build, test, style check or other purposes).                    | Yes* [* done on per job/repository combination, so needs to be configured for each new job.]          |
| Jenkins   | Bitbucket | Include issue tracker IDs in builds for traceability                                                             | N/A* [* IDs need to be entered manually by developers as part of commit comments.]                    |
