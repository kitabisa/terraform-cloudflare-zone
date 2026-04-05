<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | ~> 5.0 |

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
| [cloudflare_zone.domain](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/data-sources/zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_id"></a> [account_id](#input\_account_id) | Account ID | `string` | `""` | no |
| <a name="input_cache_rules"></a> [cache_rules](#input\_cache_rules) | Cache rules configuration | <pre>list(object({<br>    name        = string<br>    expression  = optional(any)<br>    cache       = optional(any)<br>    browser_ttl = optional(map(any))<br>    edge_ttl    = optional(map(any))<br>    enabled     = optional(any)<br>  }))</pre> | `[]` | no |
| <a name="input_cloudflare_api_token"></a> [cloudflare\_api\_token](#input\_cloudflare\_api_token) | Cloudflare API token | `string` | `null` | no |
| <a name="input_page_rules"></a> [page_rules](#input\_page_rules) | Page rules configuration | <pre>list(object({<br>    target   = string<br>    priority = number<br>    status   = string<br>    actions = object({<br>      always_use_https            = optional(any)<br>      automatic_https_rewrites    = optional(any)<br>      browser_cache_ttl           = optional(any)<br>      browser_check               = optional(any)<br>      bypass_cache_on_cookie      = optional(any)<br>      cache_by_device_type        = optional(any)<br>      cache_deception_armor       = optional(any)<br>      cache_level                 = optional(any)<br>      cache_on_cookie             = optional(any)<br>      disable_apps                = optional(any)<br>      disable_zaraz               = optional(any)<br>      disable_performance         = optional(any)<br>      disable_railgun             = optional(any)<br>      disable_security            = optional(any)<br>      edge_cache_ttl              = optional(any)<br>      email_obfuscation           = optional(any)<br>      host_header_override        = optional(any)<br>      ip_geolocation              = optional(any)<br>      mirage                      = optional(any)<br>      opportunistic_encryption    = optional(any)<br>      origin_error_page_pass_thru = optional(any)<br>      polish                      = optional(any)<br>      resolve_override            = optional(any)<br>      respect_strong_etag         = optional(any)<br>      response_buffering          = optional(any)<br>      rocket_loader               = optional(any)<br>      security_level              = optional(any)<br>      server_side_exclude         = optional(any)<br>      sort_query_string_for_cache = optional(any)<br>      ssl                         = optional(any)<br>      true_client_ip_header       = optional(any)<br>      waf                         = optional(any)<br>      forwarding_url              = optional(map(any))<br>      cache_ttl_by_status         = optional(map(any))<br>      minify                      = optional(map(any))<br>      cache_key_fields            = optional(map(any))<br>    })<br>  }))</pre> | `[]` | no |
| <a name="input_records"></a> [records](#input\_records) | List of DNS records | `list(any)` | `null` | no |
| <a name="input_redirect_rules"></a> [redirect_rules](#input\_redirect_rules) | Redirect rules configuration | <pre>list(object({<br>    name        = string<br>    expression  = optional(any)<br>    target_url  = optional(any)<br>    status_code = optional(any)<br>    enabled     = optional(any)<br>  }))</pre> | `[]` | no |
| <a name="input_zone_name"></a> [zone_name](#input\_zone_name) | DNS Zone name | `string` | `""` | no |
| <a name="input_zone_settings"></a> [zone_settings](#input\_zone_settings) | Zone setting configuration | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dns-record"></a> [dns-record](#output\_dns-record) | DNS records map |
| <a name="output_domain"></a> [domain](#output\_domain) | Cloudflare zone data source |
<!-- END_TF_DOCS -->
