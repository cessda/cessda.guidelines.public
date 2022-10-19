---
title: Documentation Tooling
parent: Software Development Guidelines
grand_parent: Software Development
nav_order: 1804
---

# {{ page.title }}

To generate static documentation pages, including this one, CESSDA uses [Jekyll](https://jekyllrb.com).
A custom [CESSDA theme](https://rubygems.org/gems/jekyll-cessda-docs) has been developed based on the
[Just the docs](https://github.com/just-the-docs/just-the-docs) theme.

As such, the documentation for [Just the docs](https://just-the-docs.github.io/just-the-docs/) can be followed,
but the design should not be touched.

The repository for the [CESSDA Technical Guidelines](https://bitbucket.org/cessda/cessda.guidelines.public)
should be consulted for implementation details.
The repository's `README` also lists a number of recommendations on language.

## Using the CESSDA theme

To use the CESSDA theme, install the Ruby gem `jekyll-cessda-docs`, e.g. with a `Gemfile`:

```ruby
source 'https://rubygems.org'
gem 'jekyll-cessda-docs'
gem 'html-proofer'
gem 'mdl'
gem 'rake'
```

Then make sure to specify the theme in your `_config.yml`

```yaml
theme: jekyll-cessda-docs
```

To get started locally, make sure to [have Ruby installed](https://jekyllrb.com/docs/installation/), then run

```shell
gem install jekyll bundler
bundle install
bundle exec jekyll serve
```

### Just the docs support

You can use most of the functionalities of Just the docs, in particular
[search](https://just-the-docs.github.io/just-the-docs/docs/search/).

### Matomo

The theme allows to enable support for CESSDA's Matomo through a `_config.yml` setting

```yaml
matomo_siteid: '0'
```

The siteid must be registered in Matomo first and configured to only accept the correct domains.

### CESSDA Technical Guidelines

For the CESSDA Technical Guidelines a glossary functionality has been added.
Glossary entries must be added to `_data/glossary.yml` and referenced using

```liquid
{%- raw -%}
{% include glossary.html entry="RI" text="RI" %}
{% endraw -%}
```

Note that glossary entries have to be referenced with exact matching, including case.
It is possible to display a different text in-line though:

```liquid
{%- raw -%}
{% include glossary.html entry="RI" text="Research Infrastructure" %}
{% endraw -%}
```

Also, always make sure to run the local instance with

```shell
bundle exec jekyll serve --config _config.yml,_devsettings.yml
```

## Quality measures

### Markdown linting

CESSDA uses [`mdl`](https://github.com/markdownlint/markdownlint) for Markdown linting
(included with the above `Gemfile`) with the following configuration

* `.mdl.style`

```config
all
rule 'MD003', :style => :atx
rule 'MD009', :br_spaces => 2
rule 'MD013', :line_length => 140, :tables => false
```

* `.mdlrc`

```config
style File.join(File.dirname(__FILE__), '.mdl.style')
ignore_front_matter true
```

### HTML checking

CESSDA uses [`html-proofer`](https://github.com/gjtorikian/html-proofer) to verify the output.

### Rakefile

The following `Rakefile` defines the jobs

* `bundle exec rake lint`
* `bundle exec rake htmlproofer`

`Rakefile`

```ruby
require 'html-proofer'

task default: %w[lint]

task :lint do
  exec 'find . -name "*.md" | grep -v "^.\/vendor\/" | xargs mdl'
end

task :htmlproofer do
  options = { :only_4xx => true, :allow_hash_href => true }
  HTMLProofer.check_directory("./_site", options).run
end
```
