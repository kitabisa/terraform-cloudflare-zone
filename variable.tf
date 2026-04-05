variable "cloudflare_api_token" {
  default     = null
  description = "Cloudflare api token."
  nullable    = true
}

variable "zone_name" {
  default     = ""
  description = "DNS Zone"
}

variable "account_id" {
  default     = ""
  description = "Account ID"
}

variable "records" {
  type        = list(any)
  default     = null
  description = "List of DNS Record"
}

variable "page_rules" {
  default = []
  type = list(object({
    target   = string
    priority = number
    status   = string
    actions = object({
      always_use_https            = optional(any)
      automatic_https_rewrites    = optional(any)
      browser_cache_ttl           = optional(any)
      browser_check               = optional(any)
      bypass_cache_on_cookie      = optional(any)
      cache_by_device_type        = optional(any)
      cache_deception_armor       = optional(any)
      cache_level                 = optional(any)
      cache_on_cookie             = optional(any)
      disable_apps                = optional(any)
      disable_zaraz               = optional(any)
      disable_performance         = optional(any)
      disable_railgun             = optional(any)
      disable_security            = optional(any)
      edge_cache_ttl              = optional(any)
      email_obfuscation           = optional(any)
      host_header_override        = optional(any)
      ip_geolocation              = optional(any)
      mirage                      = optional(any)
      opportunistic_encryption    = optional(any)
      origin_error_page_pass_thru = optional(any)
      polish                      = optional(any)
      resolve_override            = optional(any)
      respect_strong_etag         = optional(any)
      response_buffering          = optional(any)
      rocket_loader               = optional(any)
      security_level              = optional(any)
      server_side_exclude         = optional(any)
      sort_query_string_for_cache = optional(any)
      ssl                         = optional(any)
      true_client_ip_header       = optional(any)
      waf                         = optional(any)
      forwarding_url              = optional(map(any))
      cache_ttl_by_status         = optional(map(any))
      minify                      = optional(map(any))
      cache_key_fields            = optional(map(any))
    })
  }))
}

variable "zone_settings" {
  default     = {}
  description = "Zone setting configuration"
}

variable "redirect_rules" {
  default = []
  type = list(object({
    name        = string
    expression  = optional(any)
    target_url  = optional(any)
    status_code = optional(any)
    enabled     = optional(any)
  }))
}

variable "cache_rules" {
  default = []
  type = list(object({
    name        = string
    expression  = optional(any)
    cache       = optional(any)
    browser_ttl = optional(map(any))
    edge_ttl    = optional(map(any))
    enabled     = optional(any)
  }))
}
