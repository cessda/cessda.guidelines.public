---
title: Issue Tracking Workflow
parent: Software Development
nav_order: 105
---

# {{ page.title }}

We use Bitbucket Issue Tracking for projects that need an issue tracker for Service Providers and CESSDA MO use.
Where a product is made up of many components, only one of the repositories will have the issue tracker enabled, to avoid confusion.

## Workflow

The basics are that an issue should be assigned to somebody on creation - its status will be ‘*new*’
and it should be given a realistic priority (you may only want to use ‘*major*’ and ‘*minor*’ to simplify things).
The type is typically '*bug*' for software issues and ‘*task*’ for content issues.

When the assignee starts work on an issue, s/he should change the status to ‘*open*’.
When they think they have fixed it, they change the status to ‘*resolved*’.
The reporter/creator should decide if the issue has been fixed satisfactorily,
and change the status to ‘*closed*’ if it has been, or ‘*open*’ if not.
There are some other issue statuses, but ‘*new, open, resolved* and *closed*’ are the most frequently used.

Some issue trackers have additional fields, such as '*Version*' and '*Component*'. Please select an appropriate value from the list.
