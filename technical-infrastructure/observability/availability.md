---
title: Availability and status
parent: Observability
has_children: true
grand_parent: Technical Infrastructure
nav_order: 3951
---

# {{ page.title }}

## Availability

Availability is typically expressed as the percentage of time that the service was up in a given time period.

## Status

The status of a service is typically indicated as up/down or available/unavailable.

## Availability and Status Monitoring

All CESSDA services are monitored by [Uptime Robot](https://uptimerobot.com/).
Each service endpoint is sent a ping request every 5 minutes.
If a timely response is not received, Uptime Robot sends an alert message,
which is picked up by CESSDA's
[Observability framework]({% link technical-infrastructure/observability/index.md %})
and escalated accordingly.
In some cases, the presence/absence of a keyword of phrase is checked for every five minute
(to detect cases when a service is up, but the content is missing for some reason).
Again, Uptime Robot sends an alert as appropriate, which is dealt with in the same way.

CESSDA services that have been onboarded to the EOSC Marketplace
are also monitored by [ARGO](https://monitoring.eosc-portal.eu/), the EOSC monitoring system.
