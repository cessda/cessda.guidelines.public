---
title: Observability
parent: Technical Infrastructure
has_children: true
nav_order: 395
---

# {{ page.title }}

CESSDA IT observability is a business process that collects and analyses data from its infrastructure
and leverages that data to improve business results and drive value creation for the organization.
Observability of the infrastructure includes:

- CESSDA Core {% include glossary.html entry="(product)" text="Products" %}

(one of CDC, CVS, EQB, ELSST)

- Infrastructure Management tools,
  {% include glossary.html entry="(CI)" text="CI/CT" %} process with Jenkins

The observability strategy is made up of three pillars:

![CESSDA Observability](../../images/observability-3.jpg)

1. **Logging & aggregation:** Logs are detailed records of events that occur within the components
  or the infrastructure in general.
  The [central logging system]({% link technical-infrastructure/observability/logging-overview.md %}) collects, aggregates,
  filters and enriches the contents of the logs and enables visualisation of system and product events,
  which can aid debugging and problem solving.
2. **Metrics Monitoring:** Metrics represent the raw measurements of resource usage or behaviour that can be
  observed and collected throughout the infrastructure.
  The [monitoring system]({% link technical-infrastructure/observability/monitoring-overview.md %}) collects, exposes,
  and analyses those values to improve awareness of the characteristics and behaviour of the components
  the the core products are composed of.
3. **Alerting:** Alerting is the responsive component of the observability system that performs actions based on
  changes in metrics, threshold violations or/and the occurrence of unacceptable conditions.

Alert notifications are sent via email or dedicated Slack channels, and are based on the following measurements:

- [Metrics]({% link technical-infrastructure/observability/monitoring-overview.md %}): generated from the monitoring system when metrics pass thresholds that represent problems occur.
- [Logs]({% link technical-infrastructure/observability/logging-overview.md %}): generated from the logging system if failures or unacceptable conditions are reported.
- [Service Endpoints]({% link technical-infrastructure/observability/availability.md %}): generated when internal health checks or external endpoint checks provided by [Uptime Robot](https://uptimerobot.com/) fail to receive appropriate responses.
- Processes: generated when there are failures in the CI/CT processes.
