---
title: Merging and Pull Requests
parent: Software Development
published: true
nav_order: 190
---
# {{ page.title }}

This document specifies CESSDA's policies for branching, pull requests and merging.

## Development

When developing CESSDA products, we expect that developers will create branches to organise work.
The branches should be named after the issue that is being worked on.
For example, if a developer is working on an issue titled "#23 - Update the spinner",
the branch name chosen should be similar to `feature/23-update-spinner`.

Commits in these branches must also be tagged with the issue number.
This allows the commits to be linked to issues automatically on platforms such as GitHub.
It also links the commits to the issue beyond the lifetime of the branch.
An example commit message may be "#23: Implemented the framework for the new spinner".

Branches should be pushed regularly from development machines to the remote repository.
This allows continuous integration testing to run on the branch, giving feedback in case of compilation issues and test failures.

## Pull Requests and Code Review

[Pull requests](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-pull-requests)
are a structured workflow for merging changes from development branches or repositories into the main branch of a repository.
They contain a description of the purpose of a change and combine multiple commits.
Pull requests also contain a review mechanism, allowing other members of a repository to sanity check changes.

In CESSDA pull requests are created by the main author of the branch.
It should contain a description of the changes made in the pull request.
This should not be the same as the commit messages, but should be broader in scope.

Pull requests are reviewed by other members of the repository familiar with the repository's contents.
If changes are necessary, feedback must be given on what changes are required.
This iteration loop should continue until changes are resolved to the reviewer's expectations.
Once this happens, the reviewer should approve the changes and the author should merge them.

## Manual Merging

Manually merging commits from development branches into the main branch is not recommended.
It bypasses the pull request review mechanism and should only be done if absolutely necessary.
