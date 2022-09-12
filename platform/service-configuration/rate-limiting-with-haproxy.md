---
title: Rate limiting with HAProxy
parent: Service Configuration
grand_parent: Technical Infrastructure
nav_order: 392
---

# {{ page.title }}

Denial of service attacks can easily overload websites.
This prevents users from accessing the website normally, reducing the quality of the user experience.

Request limits can help mitigate these class of attacks,
and HAProxy offers capabilities to set reasonable limits for users on a per IP address basis.

## Example configuration

See [HAProxy's documentation on application-layer DDOS protection](https://www.haproxy.com/blog/application-layer-ddos-attack-protection-with-haproxy/).

This limits the rate that an IP address can access the API of CVS to 10 requests per second

```haproxy
acl api url_beg /v1/
http-request track-sc0 src table per_ip_rates if api
http-request deny deny_status 429 if { sc_http_req_rate(0) gt 10 }
```

This defines an access rule (known as an ACL) that should track only the users that access the `/v1/` path.
If a request matches this rule, it is tracked in the table stored in the backend `per_ip_rates`.

```haproxy
backend per_ip_rates
    stick-table type ip size 1m expire 10m store http_req_rate(10s)
```

This table stores entries for 10 seconds before expiry.

Combined with the third line this causes an IP address that makes more than 10 requests in 10 seconds to receive HTTP 429 status codes.

## Configuring Kubernetes

Kubernetes needs extra configuration as it doesn't send IP addresses of clients to HAProxy by default.
To fix this, modify the service definition so that the `externalTrafficPolicy` is set to `local`:

```yaml
...
spec:
  externalTrafficPolicy: Local
  type: LoadBalancer
...
```

See the Kubernetes documentation on [preserving the client source IP](https://kubernetes.io/docs/tasks/access-application-cluster/create-external-load-balancer/#preserving-the-client-source-ip)
for more details.
