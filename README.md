# CESSDA Technical Guidelines

This repository contains the technical guidelines for CESSDA ERIC.

## Technical Implementation

The documentation is written in markdown files and compiled to html using [Jekyll](https://jekyllrb.com)
with the [Just the docs](https://github.com/pmarsceill/just-the-docs) theme.

To get started locally, make sure to [have Ruby installed](https://jekyllrb.com/docs/installation/), then run

```shell
gem install jekyll bundler
bundle install
bundle exec jekyll serve --config _config.yml,_devsettings.yml
```

### Menu structure

The page order and navigation structure is defined manually using
the [theme's options](https://pmarsceill.github.io/just-the-docs/docs/navigation-structure/).

## Development

The documentation uses Markdown files with Jekyll headers.
We follow the [Google Style Guide for Markdown](https://google.github.io/styleguide/docguide/style.html),
including ATX style headers and maximal line lengths of 140 characters.

General recommendations:

* Start a new sentence on a new line and use logical places to wrap text if exceeding the line limit.
* Use lazy numbering for lists and appropriate measures to reduce the need to touch other lines/files when making changes.
* Use third person point of view and avoid narrative style.
* Describe current state, avoid use of future tense.

Compliance is checked with [markdownlint](https://github.com/markdownlint/markdownlint) by running

```shell
bundle exec rake lint
```
