---
title: Issue Tracking Workflow
parent: Software Development
nav_order: 150
---

# {{ page.title }}

We use GitHub Issue Tracking for projects that need an issue tracker for Service Providers and CESSDA MO use.
Where a product is made up of many components, only one of the repositories will have the issue tracker enabled, to avoid confusion.

## Workflow

The basics are that an issue should be assigned to somebody on creation - its status will be ‘*new*’
and it should be given a realistic priority (you may only want to use ‘*major*’ and ‘*minor*’ to simplify things).
The type is typically '*bug*' for software issues like unexpected behaviour,
and ‘*task*’ for improvements like user interface enhancements.

When the assignee starts work on an issue, the status of the issue should be changed by the assignee to ‘*open*’.
When the assignee considers the issue to be fixed, the status of the issue should be changed by the assignee to ‘*resolved*’.
The reporter/creator should decide if the issue has been fixed satisfactorily,
and change the status to ‘*closed*’ if it has been, or ‘*open*’ if not. If the issue is reopened,
the reporter/creator must write a comment explaining why the assignee's resolution is unsatisfactory.
There are some other issue statuses, but ‘*new, open, resolved* and *closed*’ are the most frequently used.

Some issue trackers have additional fields, such as '*Version*' and '*Component*'.
The meaning of these fields should be documented in the readme file associated with the issue tracker's project.
Please select an appropriate value from the list.
