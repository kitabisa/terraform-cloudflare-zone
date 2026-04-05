# Terraform Cloudflare Zone Module

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Terraform](https://img.shields.io/badge/Terraform-%E2%89%A51.0+-7BA6BC?style=flat&logo=terraform)](https://www.terraform.io)
[![Provider](https://img.shields.io/badge/Cloudflare-%E2%89%A55.0+-F38020?style=flat&logo=cloudflare)](https://registry.terraform.io/providers/cloudflare/cloudflare)

A Terraform module for managing Cloudflare zones, DNS records, zone settings, redirect rules, cache rules, and page rules.

## Description

This Terraform module provides a simplified interface for managing Cloudflare zones and their associated resources. It supports:

- Zone creation and management
- DNS records (A, AAAA, CNAME, MX, TXT, etc.)
- Zone settings configuration
- Redirect rules using Cloudflare Rulesets
- Cache rules for edge caching
- Page rules for URL forwarding and caching behavior

## Usage

### Basic Usage - Zone Only

```hcl
module "cloudflare_zone" {
  source  = "kitabisa/cloudflare-zone"
  version = "x.x.x"

  zone_name = "example.com"
  account_id = "YOUR_ACCOUNT_ID"
}
```

### Usage with DNS Records

```hcl
module "cloudflare_zone" {
  source  = "kitabisa/cloudflare-zone"
  version = "x.x.x"

  zone_name = "example.com"
  account_id = "YOUR_ACCOUNT_ID"

  records = [
    {
      name    = "www"
      type    = "CNAME"
      content = "example.herokuapp.com"
      proxied = true
    },
    {
      name    = "@"
      type    = "A"
      content = "192.0.2.1"
      proxied = false
    },
    {
      name    = "@"
      type    = "MX"
      content = "mail.example.com"
      priority = 10
      proxied = false
    }
  ]
}
```

### Full Configuration Example

```hcl
module "cloudflare_zone" {
  source  = "kitabisa/cloudflare-zone"
  version = "x.x.x"

  zone_name = "example.com"
  account_id = "YOUR_ACCOUNT_ID"

  # DNS Records
  records = [
    {
      name    = "www"
      type    = "CNAME"
      content = "example.herokuapp.com"
      proxied = true
    },
    {
      name    = "api"
      type    = "A"
      content = "10.0.0.1"
      proxied = false
      ttl     = 300
    }
  ]

  # Zone Settings
  zone_settings = {
    ssl             = "strict"
    always_use_https = "on"
    min_tls_version = "1.2"
    tls_1_3         = "on"
    http3           = "on"
    brotli          = "on"
  }

  # Redirect Rules
  redirect_rules = [
    {
      name        = "Redirect www to non-www"
      expression  = "(http.host eq \"www.example.com\")"
      target_url  = "https://example.com$1"
      status_code = 301
      enabled     = true
    }
  ]

  # Cache Rules
  cache_rules = [
    {
      name       = "Cache static assets"
      expression = "(http.request.uri.path matches \"\\.(css|js|png|jpg|jpeg|gif|ico|svg|woff|woff2)$\")"
      cache      = true
      edge_ttl   = { mode = "override_origin", default = 86400 }
      browser_ttl = { mode = "respect_origin", default = 0 }
      enabled    = true
    }
  ]

  # Page Rules
  page_rules = [
    {
      target   = "example.com/blog/*"
      priority = 1
      status   = "active"
      actions = {
        forwarding_url = {
          url         = "https://blog.example.com$1"
          status_code = 301
        }
      }
    }
  ]
}
```

## Examples

Find more examples in the [examples](./examples/) directory:

- [basic](./examples/basic/) - Simple zone creation
- [with-dns-records](./examples/with-dns-records/) - Zone with DNS records
- [full-configuration](./examples/full-configuration/) - All features enabled

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0 |
| cloudflare | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| cloudflare | ~> 5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [cloudflare_dns_record.dns_record](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/dns_record) | resource |
| [cloudflare_page_rule.page_rule](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/page_rule) | resource |
| [cloudflare_ruleset.cache_config](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/ruleset) | resource |
| [cloudflare_ruleset.single_redirects](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/ruleset) | resource |
| [cloudflare_zone.domain](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/zone) | resource |
| [cloudflare_zone_setting.*](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/zone_setting) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_id"></a> [account_id](#input\_account\_id) | Cloudflare account ID | `string` | `""` | no |
| <a name="input_cache_rules"></a> [cache_rules](#input\_cache\_rules) | Cache rules configuration | <pre>list(object({<br>    name        = string<br>    expression  = optional(string)<br>    cache       = optional(bool)<br>    browser_ttl = optional(map(any))<br>    edge_ttl    = optional(map(any))<br>    enabled     = optional(bool)<br>  }))</pre> | `[]` | no |
| <a name="input_cloudflare_api_token"></a> [cloudflare\_api\_token](#input\_cloudflare\_api\_token) | Cloudflare API token | `string` | `null` | yes |
| <a name="input_page_rules"></a> [page_rules](#input\_page\_rules) | Page rules configuration | <pre>list(object({<br>    target   = string<br>    priority = number<br>    status   = string<br>    actions = object({<br>      always_use_https            = optional(bool)<br>      automatic_https_rewrites    = optional(bool)<br>      browser_cache_ttl           = optional(number)<br>      browser_check               = optional(bool)<br>      bypass_cache_on_cookie      = optional(string)<br>      cache_by_device_type        = optional(bool)<br>      cache_deception_armor       = optional(bool)<br>      cache_level                 = optional(string)<br>      cache_on_cookie             = optional(string)<br>      disable_apps                = optional(bool)<br>      disable_zaraz               = optional(bool)<br>      disable_performance         = optional(bool)<br>      disable_railgun             = optional(bool)<br>      disable_security            = optional(bool)<br>      edge_cache_ttl              = optional(number)<br>      email_obfuscation           = optional(bool)<br>      forwarding_url              = optional(map(any))<br>      host_header_override        = optional(string)<br>      ip_geolocation              = optional(bool)<br>      mirage                      = optional(bool)<br>      opportunistic_encryption    = optional(bool)<br>      origin_error_page_pass_thru = optional(bool)<br>      polish                      = optional(string)<br>      resolve_override            = optional(string)<br>      respect_strong_etag         = optional(bool)<br>      response_buffering          = optional(bool)<br>      rocket_loader               = optional(bool)<br>      security_level              = optional(string)<br>      server_side_exclude         = optional(bool)<br>      sort_query_string_for_cache = optional(bool)<br>      ssl                         = optional(string)<br>      true_client_ip_header       = optional(bool)<br>      waf                         = optional(bool)<br>    })<br>  }))</pre> | `[]` | no |
| <a name="input_records"></a> [records](#input\_records) | List of DNS records | <pre>list(object({<br>    name     = string<br>    type     = string<br>    content  = string<br>    proxied  = optional(bool, false)<br>    ttl      = optional(number, 3600)<br>    priority = optional(number)<br>  }))</pre> | `null` | no |
| <a name="input_redirect_rules"></a> [redirect_rules](#input\_redirect\_rules) | Redirect rules configuration | <pre>list(object({<br>    name                  = string<br>    expression            = optional(string)<br>    target_url            = optional(string)<br>    status_code           = optional(number)<br>    enabled               = optional(bool)<br>    preserve_query_string = optional(bool)<br>  }))</pre> | `[]` | no |
| <a name="input_zone_name"></a> [zone_name](#input\_zone\_name) | DNS Zone name | `string` | `""` | yes |
| <a name="input_zone_settings"></a> [zone_settings](#input\_zone\_settings) | Zone setting configuration | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dns_record"></a> [dns_record](#output\_dns\_record) | Map of created DNS records |
| <a name="output_zone"></a> [zone](#output\_zone) | Cloudflare zone resource |
| <a name="output_zone_id"></a> [zone_id](#output\_zone\_id) | Cloudflare zone ID |
<!-- END_TF_DOCS -->

## DNS Record Types

This module supports the following DNS record types:

| Type | Description | Supports Priority | Supports Proxy |
|------|-------------|:-----------------:|:--------------:|
| `A` | IPv4 address | No | Yes |
| `AAAA` | IPv6 address | No | Yes |
| `CNAME` | Canonical name | No | Yes |
| `MX` | Mail exchange | Yes | No |
| `TXT` | Text record | No | No |
| `SPF` | Sender Policy Framework | No | No |
| `DKIM` | DomainKeys Identified Mail | No | No |
| `NS` | Name server | No | No |
| `SOA` | Start of Authority | No | No |
| `CAA` | Certification Authority Authorization | No | No |

## Zone Settings

Available zone settings that can be configured via the `zone_settings` variable:

| Setting | Type | Description |
|---------|------|-------------|
| `always_online` | string | Keep site online when server returns 500 |
| `always_use_https` | string | Redirect all HTTP requests to HTTPS |
| `automatic_https_rewrites` | string | Enable automatic HTTPS rewrites |
| `brotli` | string | Enable Brotli compression |
| `browser_cache_ttl` | number | Browser cache TTL in seconds |
| `browser_check` | string | Enable browser integrity check |
| `cache_level` | string | Cache level (basic, ignore_query_string, standard, aggressive) |
| `challenge_ttl` | number | Challenge TTL in seconds |
| `cname_flattening` | string | CNAME flattening (all, flatten_all) |
| `development_mode` | string | Development mode (off, on) |
| `email_obfuscation` | string | Enable email obfuscation |
| `h2_prioritization` | string | Enable HTTP/2 prioritization |
| `hotlink_protection` | string | Enable hotlink protection |
| `http2` | string | Enable HTTP/2 |
| `http3` | string | Enable HTTP/3 |
| `image_resizing` | string | Enable image resizing |
| `ip_geolocation` | string | Enable IP geolocation |
| `ipv6` | string | Enable IPv6 |
| `max_upload` | number | Max upload size in bytes |
| `min_tls_version` | string | Minimum TLS version (1.0, 1.1, 1.2, 1.3) |
| `mirage` | string | Enable Mirage |
| `opportunistic_encryption` | string | Enable opportunistic encryption |
| `opportunistic_onion` | string | Enable opportunistic onion |
| `origin_error_page_pass_thru` | string | Pass through origin error pages |
| `polish` | string | Image Polish (off, lossy, lossless) |
| `prefetch_preload` | string | Enable prefetch preload |
| `privacy_pass` | string | Enable Privacy Pass |
| `pseudo_ipv4` | string | Pseudo IPv4 (off, add_header, overwrite_header) |
| `response_buffering` | string | Enable response buffering |
| `rocket_loader` | string | Enable Rocket Loader |
| `security_level` | string | Security level (high, medium, low, essentially_off) |
| `server_side_exclude` | string | Enable Server Side Exclude |
| `sort_query_string_for_cache` | string | Sort query strings for cache |
| `ssl` | string | SSL mode (off, flexible, strict, full) |
| `tls_1_3` | string | Enable TLS 1.3 |
| `tls_client_auth` | string | Enable TLS client authentication |
| `true_client_ip_header` | string | Enable True Client IP header |
| `waf` | string | Enable Web Application Firewall |
| `webp` | string | Serve WebP images |
| `websockets` | string | Enable WebSockets |
| `0rtt` | string | Enable 0-RTT |
| `minify` | map | Minify settings |
| `mobile_redirect` | map | Mobile redirect settings |
| `security_header` | map | Security header settings |

## Contributing

Contributions are welcome! Please read our [contributing guidelines](CONTRIBUTING.md) before submitting PRs.

## License

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.

You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.

See the License for the specific language governing permissions and
limitations under the License.
