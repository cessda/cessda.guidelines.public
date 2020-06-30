---
title: Software Publication
layout: page
parent: Software Releases
grand_parent: Software Development
---

# Software Publication

Software releases of open source components should be published on Zenodo, as per CESSDA's Publication Policy.

A publication consists of a release tarball matching the release tag in the repository.
This can be done by

```shell
git archive --format=tar TAG
```

where `TAG` is the release's tag, though [Zenodo](https://guides.github.com/activities/citable-code/) has support for some other platforms.

The `README` and `Changelog` must be up to date prior to release
and they must be added to the Zenodo record in addition to the tarball.

The description must be self-explanatory and should ideally match the README's summary.

## Citation

The version-independent DOI must be added in the repository's README as recommended citation unless referring to specific releases.
