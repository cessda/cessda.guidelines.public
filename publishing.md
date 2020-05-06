# Publishing software releases on Zenodo

* make sure intermediate builds don't have full semver-versions!! (e.g. add -snapshot or something?)
* Perform the [release](release.md)
  * set the version in the pom.xml (!!chicken and egg!!)
  * update readme and changelog
  * build
  * tag the image
  * tag the git commit

* do a [git archive](https://git-scm.com/docs/git-archive)
* put tgz, readme and changelog on zenodo, with a sensible description
* remember to do a new version of the existing object

* Link to the code repository from Zenodo using a related identifier of type "is the source this upload is derived from"

* Add the version-independent DOI to the README.

