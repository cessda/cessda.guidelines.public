# CESSDA Technical Guidelines

This repository contains the technical guidelines for CESSDA ERIC.
Pull Requests from CESSDA affiliated developers are highly welcome.

## Technical Implementation

The documentation is written in markdown files and compiled to html using [Jekyll](https://jekyllrb.com)
with the [CESSDA theme](https://rubygems.org/gems/jekyll-cessda-docs) based on the
[Just the docs](https://github.com/just-the-docs/just-the-docs) theme.

To get started locally, make sure to [have Ruby installed](https://jekyllrb.com/docs/installation/), then run

```shell
gem install jekyll bundler
bundle install
bundle exec jekyll serve --config _config.yml,_devsettings.yml
```

### Menu structure

The page order and navigation structure is defined manually using
the [theme's options](https://just-the-docs.github.io/just-the-docs/docs/navigation-structure/).

## Development

The documentation is written using Markdown files with Jekyll headers.
Coding follows the [Google Style Guide for Markdown](https://google.github.io/styleguide/docguide/style.html),
including ATX style headers and a maximal line lengths of 140 characters.
We follow British spelling with -ise, check e.g. with `aspell --lang=en_GB-ise`.

Style Guide compliance is checked with [markdownlint](https://github.com/markdownlint/markdownlint) by running

```shell
bundle exec rake lint
```

Technical documentation is generally used for consultation or reference, instead of being read from beginning to end.
This use case forms the basis for form and structure of the CESSDA Technical Guidelines.
As a general rule, the »*what*« should be most prominently presented, followed by the motivation and optional examples.

General recommendations:

* Avoid narrative style in favour of clear, direct and neutral language.
* Use active voice with a third person point of view.
* Describe current state, avoid the use of past and future tense.
* Pages should be to-the-point and ideally above the fold on office screens.
* Split longer texts into short topical pages and use interlinking.
* Use lists and structure through headings and short paragraphs.
* Document state, not historical emergence or decision basis.
* Avoid ambiguous language and complicated grammatical structure and vocabulary.
* Screenshots should be small and reduced to relevant parts, ideally highlighting relevant sections and cutting unnecessary information.
* Pictures within the same page should harmonise with each other and with the page text font size.

Practical recommendations:

* Use lower case file names with hyphens as word separators.
* Put all images in the `images` folder, only theme-related files go into `assets`.
* Start a new sentence on a new line and use logical places to wrap text if exceeding the line limit.
* Use lazy numbering for lists and appropriate measures to reduce the need to touch other lines/files when making changes.
* Glossary entries must be added to `_data/glossary.yml` and referenced using

```liquid
{% include glossary.html entry="RI" text="RI" %}
```

Note that glossary entries have to be referenced with exact matching, including case.
It is possible to display a different text in-line though:

```liquid
{% include glossary.html entry="RI" text="Research Infrastructure" %}
```

### Releases

By default, development builds are created. The release process is

1. Update the Changelog
1. Change `development_status` to `false` in `_config.yml` and double-check the `version`
1. Build & release the outcome
1. Increase the `version` in `_config.yml` and reset `development_status` to `true`

