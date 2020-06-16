---
title: Software Releases
layout: page
parent: Software Development
has_children: true
nav_order: 040
---

# Software Releases

Releases of a CESSDA product must follow the [CESSDA Release Policy](#cessda-release-policy).

As evidence of a release, in particular for proof of deliverable,
the link to the git release tag inside a git repository
that includes the updated changelog for the version
referencing the relevant issues in the repository is provided.

For contributions to upstream products, the link to the merged pull request(s) can be used instead,
the list of changes done must then be included there.

## CESSDA Release policy

A new version of a CESSDA product can be released, once the manual evaluation
by the responsible user representative has been successfully concluded.

* Releases must follow [semantic versioning](https://semver.org/)
* Releases must have an [up-to-date Changelog]({{ site.technical-reference.url }}developer-guidelines/06-changelog.html)
* Releases must be tagged in the git repository
* Releases must be available as Docker images with the release version as tag
* Release tarballs should be [published]({% link publication.md %})

