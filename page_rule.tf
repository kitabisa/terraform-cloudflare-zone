locals {
  page_rules = var.page_rules != null ? {
    for pr in var.page_rules :
    join("/", [var.zone_name, substr(uuidv5("dns", pr.target), 0, 8)]) => pr
  } : {}
}

resource "cloudflare_page_rule" "page_rule" {
  for_each = local.page_rules

  zone_id  = data.cloudflare_zone.domain.id
  target   = each.value.target
  priority = lookup(each.value, "priority", null)
  status   = lookup(each.value, "status", null)

  actions = {
    always_use_https         = lookup(each.value.actions, "always_use_https", false)
    automatic_https_rewrites = lookup(each.value.actions, "automatic_https_rewrites", null)
    browser_cache_ttl        = lookup(each.value.actions, "browser_cache_ttl", null)
    browser_check            = lookup(each.value.actions, "browser_check", null)
    bypass_cache_on_cookie   = lookup(each.value.actions, "bypass_cache_on_cookie", null)
    cache_by_device_type     = lookup(each.value.actions, "cache_by_device_type", null)
    cache_deception_armor    = lookup(each.value.actions, "cache_deception_armor", null)
    cache_level              = lookup(each.value.actions, "cache_level", null)
    cache_on_cookie          = lookup(each.value.actions, "cache_on_cookie", null)
    disable_apps             = lookup(each.value.actions, "disable_apps", false)
    disable_performance      = lookup(each.value.actions, "disable_performance", false)
    disable_railgun          = lookup(each.value.actions, "disable_railgun", false)
    disable_security         = lookup(each.value.actions, "disable_security", false)
    disable_zaraz            = lookup(each.value.actions, "disable_zaraz", false)
    edge_cache_ttl           = lookup(each.value.actions, "edge_cache_ttl", null)
    email_obfuscation        = lookup(each.value.actions, "email_obfuscation", null)
    forwarding_url = lookup(each.value.actions, "forwarding_url", null) != null ? {
      url         = each.value.actions.forwarding_url.url
      status_code = each.value.actions.forwarding_url.status_code
    } : null
    host_header_override        = lookup(each.value.actions, "host_header_override", null)
    ip_geolocation              = lookup(each.value.actions, "ip_geolocation", null)
    mirage                      = lookup(each.value.actions, "mirage", null)
    opportunistic_encryption    = lookup(each.value.actions, "opportunistic_encryption", null)
    origin_error_page_pass_thru = lookup(each.value.actions, "origin_error_page_pass_thru", null)
    polish                      = lookup(each.value.actions, "polish", null)
    resolve_override            = lookup(each.value.actions, "resolve_override", null)
    respect_strong_etag         = lookup(each.value.actions, "respect_strong_etag", null)
    response_buffering          = lookup(each.value.actions, "response_buffering", null)
    rocket_loader               = lookup(each.value.actions, "rocket_loader", null)
    security_level              = lookup(each.value.actions, "security_level", null)
    server_side_exclude         = lookup(each.value.actions, "server_side_exclude", null)
    sort_query_string_for_cache = lookup(each.value.actions, "sort_query_string_for_cache", null)
    ssl                         = lookup(each.value.actions, "ssl", null)
    true_client_ip_header       = lookup(each.value.actions, "true_client_ip_header", null)
    waf                         = lookup(each.value.actions, "waf", null)
  }
}
