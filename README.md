# CESSDA Technical Guidelines

This repository contains the technical guidelines for CESSDA ERIC.

## Technical Implemenation

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
Markdown uses ATX style headers and maximal line lengths of 140 characters.
Compliance is checked with [markdownlint](https://github.com/markdownlint/markdownlint) by running

```shell
bundle exec rake lint
```

