---
title: Documentation Content Management
parent: Software Development
published: true
nav_order: 185
---

# {{ page.title }}

A Git repository is used to store, track changes to, build, test and deploy the user manual.

It is located at `https://github.com/cessda/cessda.<product name>.userguide`

E.g. `https://github.com/cessda/cessda.cdc.userguide`

The content source files are in Markdown format and have the extension `.md`.

The build process checks the syntax of the Markdown files using the markdown lint rules.

If there are no errors, an HTML page is generated for each Markdown file,
which is checked with HtmlProofer to make sure any image references and internal links are valid.
If all the checks pass, the pages are all deployed as a static website at
`https://<product name>.cessda.eu/documentation/`.

> For example: `https://datacatalogue.cessda.eu/documentation/`

A more detailed (and more technical) explanation can be found in
[documentation tooling]({% link software/documentation-guidelines/documentation-tooling.md %}).
