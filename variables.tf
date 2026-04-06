variable "cloudflare_api_token" {
  description = "Cloudflare API token"
  type        = string
  sensitive   = true
  default     = null
}

variable "zone_name" {
  description = "DNS Zone name"
  type        = string
  default     = ""
}

variable "account_id" {
  description = "Cloudflare account ID"
  type        = string
  default     = ""
}

variable "records" {
  description = "List of DNS records"
  type = list(object({
    name     = string
    type     = string
    content  = string
    proxied  = optional(bool, false)
    ttl      = optional(number, 3600)
    priority = optional(number)
  }))
  default = null
}

variable "page_rules" {
  description = "Page rules configuration"
  type = list(object({
    target   = string
    priority = number
    status   = string
    actions = object({
      always_use_https            = optional(bool)
      automatic_https_rewrites    = optional(bool)
      browser_cache_ttl           = optional(number)
      browser_check               = optional(bool)
      bypass_cache_on_cookie      = optional(string)
      cache_by_device_type        = optional(bool)
      cache_deception_armor       = optional(bool)
      cache_level                 = optional(string)
      cache_on_cookie             = optional(string)
      disable_apps                = optional(bool)
      disable_zaraz               = optional(bool)
      disable_performance         = optional(bool)
      disable_railgun             = optional(bool)
      disable_security            = optional(bool)
      edge_cache_ttl              = optional(number)
      email_obfuscation           = optional(bool)
      host_header_override        = optional(string)
      ip_geolocation              = optional(bool)
      mirage                      = optional(bool)
      opportunistic_encryption    = optional(bool)
      origin_error_page_pass_thru = optional(bool)
      polish                      = optional(string)
      resolve_override            = optional(string)
      respect_strong_etag         = optional(bool)
      response_buffering          = optional(bool)
      rocket_loader               = optional(bool)
      security_level              = optional(string)
      server_side_exclude         = optional(bool)
      sort_query_string_for_cache = optional(bool)
      ssl                         = optional(string)
      true_client_ip_header       = optional(bool)
      waf                         = optional(bool)
      forwarding_url              = optional(map(any))
      cache_ttl_by_status         = optional(map(any))
      minify                      = optional(map(any))
      cache_key_fields            = optional(map(any))
    })
  }))
  default = []
}

variable "zone_settings" {
  description = "Zone setting configuration"
  type        = map(any)
  default     = {}
}

variable "redirect_rules" {
  description = "Redirect rules configuration"
  type = list(object({
    name                  = string
    expression            = optional(string)
    target_url            = optional(string)
    status_code           = optional(number)
    enabled               = optional(bool)
    preserve_query_string = optional(bool)
  }))
  default = []
}

variable "cache_rules" {
  description = "Cache rules configuration"
  type = list(object({
    name        = string
    expression  = optional(string)
    cache       = optional(bool)
    browser_ttl = optional(map(any))
    edge_ttl    = optional(map(any))
    enabled     = optional(bool)
  }))
  default = []
}
