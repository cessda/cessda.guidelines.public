---
title: Observability
has_children: true
nav_order: 200
---

# {{ page.title }}

CESSDA IT Observability is a business process that collect and analyze data from its infrastructure and to leverage that data to improve business results and drive value creation for the organization. Observability of Infrstructure includes:
- CESSDA Core {% include glossary.html entry="(product)" text="Products" %}
(one of CDC, CVS, EQB, ELSST)
- Infrastructure Management tools 
-  {% include glossary.html entry="(CI)" text="CI/CT" %} process with Jenkins 

It's Observability strategy is made of three pillars :

![CESSDA Observability](../images/observability-3.jpg)

1. Metrics Monitoring : Metrics represent  the raw measurements of resource usage or behavior that can be 
observed and collected throughout our infrastructure.  [Monitoring system]({% link observability/monitoring.md %}) collects, exposes, 
and analyzes those values to improve awareness of CESSDA's components’ characteristics and behavior.
1. Logging & aggregation : Logs are detailed set of events that occur within CESSDA's microsevices or its Infrastructure in general . 
CESSDA [central logging system]({% link observability/logging.md %}) collects, filters & enrich and visulaised and aggregates from in its Infrastructure.
1. Alerting : Alerting is the responsive component of a the observablity system that performs actions based on changes in  metrics 
threshold or/and an unacceptable conditions. Alerts notification are sent via to emails or slack.  Alerts based on the following elements:
- Metrics: that generated from the monitoring system 
- Logs: producd from logging system if there are failures or unacceptable conditions occur 
- Service Endpoints:  monitored and alerted by Uptime Robot system for their availability. 
-  Processes: generated when there are failures in the CI/CT processes.