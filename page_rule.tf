locals {
  page_rules = var.page_rules != null ? {
    for pr in var.page_rules :
    join("/", [var.zone_name, substr(uuidv5("dns", pr.target), 0, 8)]) => pr
  } : {}
}

resource "cloudflare_page_rule" "page_rule" {
  for_each = local.page_rules

  zone_id  = cloudflare_zone.domain.id
  target   = each.value.target
  priority = each.value.priority
  status   = each.value.status

  actions = {
    always_use_https         = each.value.actions.always_use_https
    automatic_https_rewrites = each.value.actions.automatic_https_rewrites
    browser_cache_ttl        = each.value.actions.browser_cache_ttl
    browser_check            = each.value.actions.browser_check
    bypass_cache_on_cookie   = each.value.actions.bypass_cache_on_cookie
    cache_by_device_type     = each.value.actions.cache_by_device_type
    cache_deception_armor    = each.value.actions.cache_deception_armor
    cache_level              = each.value.actions.cache_level
    cache_on_cookie          = each.value.actions.cache_on_cookie
    disable_apps             = each.value.actions.disable_apps
    disable_performance      = each.value.actions.disable_performance
    disable_railgun          = each.value.actions.disable_railgun
    disable_security         = each.value.actions.disable_security
    disable_zaraz            = each.value.actions.disable_zaraz
    edge_cache_ttl           = each.value.actions.edge_cache_ttl
    email_obfuscation        = each.value.actions.email_obfuscation
    forwarding_url = each.value.actions.forwarding_url != null ? {
      url         = each.value.actions.forwarding_url.url
      status_code = each.value.actions.forwarding_url.status_code
    } : null
    host_header_override        = each.value.actions.host_header_override
    ip_geolocation              = each.value.actions.ip_geolocation
    mirage                      = each.value.actions.mirage
    opportunistic_encryption    = each.value.actions.opportunistic_encryption
    origin_error_page_pass_thru = each.value.actions.origin_error_page_pass_thru
    polish                      = each.value.actions.polish
    resolve_override            = each.value.actions.resolve_override
    respect_strong_etag         = each.value.actions.respect_strong_etag
    response_buffering          = each.value.actions.response_buffering
    rocket_loader               = each.value.actions.rocket_loader
    security_level              = each.value.actions.security_level
    server_side_exclude         = each.value.actions.server_side_exclude
    sort_query_string_for_cache = each.value.actions.sort_query_string_for_cache
    ssl                         = each.value.actions.ssl
    true_client_ip_header       = each.value.actions.true_client_ip_header
    waf                         = each.value.actions.waf
  }
}
