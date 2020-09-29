---
title: Authenticating with eduTEAMS
parent: Technical Infrastructure
nav_order: 392
---

# {{ page.title }}

## Terminology

See [Naming Conventions]({% link platform/naming-conventions.md %}).

## Introduction to eduTEAMS

CESSDA uses [eduTEAMS](https://eduteams.org/) to provide single sign on (SSO) for tools and services running on the CESSDA platform.

eduTEAMS controls access to restricted resources using virtual organisations,
which can contain groups for more granular access controls.

To be compatible with eduTEAMS, services are required to support [OpenID Connect](https://openid.net/connect/) or
[SAML](http://docs.oasis-open.org/security/saml/Post2.0/sstc-saml-tech-overview-2.0.html).

## Connecting Services to eduTEAMS

The reference documentation is available at [Reference Documentation](https://wiki.geant.org/display/eduTEAMS/Registering+services+on+the+eduTEAMS+Service).

Firstly, fill out the form at <https://webapp.eduteams.org/sp_request>.

Make sure to select the technology that the service uses (i.e. OpenID Connect or SAML),
as well as the correct flow and token endpoint method if OpenID Connect is used.

Note down the Client ID and the secret, and save them both in a safe place.
These credentials cannot be retrieved again after the form is closed.

The ClientID and secrets used with production systems must be handled by the CESSDA Platform Team,
however for test systems these can be stored as part of the applications deployment.

## Using eduTEAMS Attributes

eduTEAMS defines several attributes that are available in the [Reference Documentation](https://wiki.geant.org/display/eduTEAMS/Attributes+available+to+Relying+Parties).

Here are some of the attributes of note:

* Display Name
* Email Address
* Groups
  * These are assigned in eduTEAMS Virtual Organisations, and can be used to restrict functionality like an editor to authorised users.
  * `urn:geant:eduteams.org:service:eduteams:group:CESSDA-Test:developers#eduteams.org`
    * Users with this group string are part of the *CESSDA-Test* VO and the *developers* group
    * More examples are part of the reference documentation
