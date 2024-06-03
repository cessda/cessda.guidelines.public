---
title: Home
layout: home
nav_order: 000
---

# CESSDA Technical Guidelines

These guidelines define how CESSDA products are [developed]({% link software/index.md %}),
by following CESSDA's implementation of the
[EURISE Network Technical Reference]({{ site.technical-reference.url }}).

The guidelines also define how CESSDA [operates services]({% link services/index.md %}) powered by these products.

A description of the [Technical Infrastructure]({% link technical-infrastructure/index.md %})
that CESSDA provides for the products to run on is also included.
This includes information about the underlying architectural principles.

The [Software Maturity Levels]({% link sml/index.md %})
that form the basis for CESSDA Quality Assurance are also included.

Recent changes to the guidelines can be found at [the detailed changelog](https://github.com/cessda/cessda.guidelines.public/commits/{{jekyll.environment}}).

{% if jekyll.environment == "development" %}
**This is a development build!**
{% else %}
Built from commit [{{ jekyll.environment | truncate: 7, "" }}](https://github.com/cessda/cessda.guidelines.public/commit/{{jekyll.environment}}) on {{ site.time | date: "%d %B %Y" }}.
{% endif %}

![CC-BY-4.0](images/cc-by.svg "CC-BY-4.0")
This work is licensed under
[Creative Commons Attribution 4.0 International](https://creativecommons.org/licenses/by/4.0/).
