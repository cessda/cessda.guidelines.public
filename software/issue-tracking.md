---
title: Issue Tracking Workflow
parent: Software Development
nav_order: 150
---

# {{ page.title }}

We use GitHub Issue Tracking for projects that need an issue tracker for Service Providers and CESSDA MO use.
When a product is made up of many components, to avoid confusion only one of the repositories will have the issue tracker enabled.

## Creating an Issue

An issue is a request for a change to be made to an application.

### Bug Repots

Bug reports are reports of behaviour that is undesirable in the application. These should have the "bug" label attached.

The report must describe the problem by explaining what the expected and actual behaviour of the application is. It should also describe the significance of the bug, from minor annoyances to essential workflows not working as expected. This helps developers to prioritise issues.

The report must provide a step-by-step description to reproduce the issue. This can make it much easier for the developer fixing the issue to start investigating.

An example of a bug report can be seen at <https://github.com/cessda/cessda.cdc.versions/issues/632>.

### Enhancement Requests

Enhancement requests are requests for a new feature/behaviour. It may be as simple adding a button to automate several previously manual steps, or as complex as supporting exports into a new format. These should have the "enhancement" label attached.

The request should provide a summary of how the new enhancement looks and behaves. This includes expected workflows and mock-ups of the enhancement. For UIs, a series of mock-ups showing the behaviour in action should be provided. For APIs, a set of API calls and expected request/response objects should be provided.

The request should provide a justification for the new feature by explaining how the enhancement will improve the user experience. For example, the request below explains how providing links for ELSST terms in CDC to the source ELSST thesaurus enhances the metadata's semantic meaning and improves the interoperability between CESSDA's services.

An example enhancement request can be seen at <https://github.com/cessda/cessda.cdc.versions/issues/617>.

## Working on an Issue

### Triaging Issues

If there are questions that need to be answered about the issue, such as an uncertainty on what the bug is/what the reproduction steps are/what the new feature looks like, these should be asked to the issue creator in the issue's chat log. The issue description may be modified if necessary after these questions have been answered.

The issue should be prioritised based on the needs of the application and the complexity of the task. The issue is then assigned, preferably to developer groups, but could be someone specific if certain expertise is required.

### Developing and Reviewing Issues

If the issue is assigned to a group, the developer working on the issue should self-assign the issue. This is so others in the group know that the issue is being worked on by somebody and don't unnecessarily duplicate work.

A development branch should be created in the source repository and linked to the issue

> For example: `bugfix/25-fix-issue-with-dropdowns`

Once development is completed, a pull request should be created. The pull request description should describe the code changes done to resolve the issue. It should not duplicate the issue and its discussion, as pull request descriptions describe what was done to satisfy the issue - the issue itself describes the problem.

A full description of CESSDA's merging and pull request process can be found at [Merging and Pull Requests]({% link software/merging-and-pull-requests.md %})
