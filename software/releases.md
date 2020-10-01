---
title: Software Releases
parent: Software Development
has_children: true
nav_order: 140
---

# {{ page.title }}

Development of CESSDA products must ensure the [Software Requirements]({% link software/requirements.md %}) are met.

A roadmap with planned releases, including date and version number, must be maintained.
All issues shall be assigned to a release.

## Release candidates

Release candidates will be evaluated along the following criteria

* There is an [up-to-date Changelog]({{ site.technical-reference.url }}developer-guidelines/06-changelog.html)
* The releases passes the [CESSDA Quality Gate]({% link software/quality-gate.md %}),
  corresponding to its [service state]({% link services/requirements.md %})
* All issues targeted with the version must be confirmed closed by the responsible user representative

## Release

* Only positively evaluated releases candidates can be released
* Releases must follow [semantic versioning](https://semver.org/)
* Releases must be tagged in the git repository
* Releases must be available as Docker images with the release version as tag
* Release tarballs should be [published]({% link software/publication.md %})

## Proof of delivery

As evidence of a release, in particular for proof of deliverable,
the link to the git release tag inside a git repository
that includes the updated changelog for the version
referencing the relevant issues in the repository is provided.

For contributions to upstream products, the link to the merged pull request(s) can be used instead,
the list of changes done must then be included there.

