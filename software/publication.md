---
title: Software Publication
parent: Software Releases
grand_parent: Software Development
nav_order: 141
---

# {{ page.title }}

Software releases of open source components should be published on Zenodo, as per CESSDA's [Publication Policy & Procedures](https://doi.org/10.5281/zenodo.3904264).

A publication consists of a release tarball matching the release tag in the repository.
This can be done by

```shell
git archive --format=tar TAG
```

where `TAG` is the release's tag, though [Zenodo](https://docs.github.com/en/repositories/archiving-a-github-repository/referencing-and-citing-content) has support for some other platforms.

The `README` and `Changelog` must be up to date prior to release
and they must be added to the Zenodo record in addition to the tarball.

The description must be self-explanatory and should ideally match the README's summary.

## Citation

The version-independent DOI must be added in the repository's README as recommended citation unless referring to specific releases.
