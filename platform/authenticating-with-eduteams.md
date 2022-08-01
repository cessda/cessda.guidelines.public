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

eduTEAMS controls access to restricted resources using Virtual Organisations (VO),
which can contain groups for more granular access controls. The CESSDA VO has the identifier `cessda.vo.eduteams.org`.
Users can register using a [dedicated URL](https://mms.eduteams.org/registrar/?vo=eduTEAMS&targetexisting=%3Fvo%3Dcessda.vo.eduteams.org&targetnew=%3Fvo%3Dcessda.vo.eduteams.org&targetextended=%3Fvo%3Dcessda.vo.eduteams.org).

To be compatible with eduTEAMS, services are required to support [OpenID Connect](https://openid.net/connect/) or
[SAML](https://docs.oasis-open.org/security/saml/Post2.0/sstc-saml-tech-overview-2.0.html).

## Connecting Services to eduTEAMS

Registering services that run on the CESSDA infrastructure is handled by Main Office.

The reference documentation is available at [Reference Documentation](https://wiki.geant.org/display/eduTEAMS/Registering+services+on+the+eduTEAMS+Service)
and the application form is available at <https://webapp.eduteams.org/sp_request>.

Make sure to select the technology that the service uses (i.e. OpenID Connect or SAML),
as well as the correct flow and token endpoint method if OpenID Connect is used.

Note down the `Client ID` and the `secret`. These must be treated as secrets.
These credentials cannot be retrieved again after the form is closed.
<!--Link to the secrets documentation when this is written-->

## Using eduTEAMS Attributes

eduTEAMS defines several attributes that are available in the [Reference Documentation](https://wiki.geant.org/display/eduTEAMS/Attributes+available+to+Relying+Parties).

Here are some of the attributes of note:

* Display Name
* Email Address
* Groups
  * These are assigned in the eduTEAMS VO, and can be used to restrict functionality like an editor to authorised users.
  * `urn:geant:eduteams.org:service:eduteams:group:cessda.vo.eduteams.org:developers#eduteams.org`
    * Users with this group string are part of the *CESSDA* VO and the *developers* group
    * More examples are part of the reference documentation
