
removed {
  from = cloudflare_zone_settings_override.setting
  lifecycle {
    destroy = false
  }
}

resource "cloudflare_zone_setting" "setting_always_online" {
  zone_id    = data.cloudflare_zone.domain.id
  setting_id = "always_online"
  value      = lookup(var.zone_settings, "always_online", null)
  count      = length(var.zone_settings) != 0 ? 1 : 0
}

resource "cloudflare_zone_setting" "setting_always_use_https" {
  zone_id    = data.cloudflare_zone.domain.id
  setting_id = "always_use_https"
  value      = lookup(var.zone_settings, "always_use_https", null)
  count      = length(var.zone_settings) != 0 ? 1 : 0
}

resource "cloudflare_zone_setting" "setting_automatic_https_rewrites" {
  zone_id    = data.cloudflare_zone.domain.id
  setting_id = "automatic_https_rewrites"
  value      = lookup(var.zone_settings, "automatic_https_rewrites", null)
  count      = length(var.zone_settings) != 0 ? 1 : 0
}

resource "cloudflare_zone_setting" "setting_brotli" {
  zone_id    = data.cloudflare_zone.domain.id
  setting_id = "brotli"
  value      = lookup(var.zone_settings, "brotli", null)
  count      = length(var.zone_settings) != 0 ? 1 : 0
}

resource "cloudflare_zone_setting" "setting_browser_cache_ttl" {
  zone_id    = data.cloudflare_zone.domain.id
  setting_id = "browser_cache_ttl"
  value      = lookup(var.zone_settings, "browser_cache_ttl", null)
  count      = length(var.zone_settings) != 0 ? 1 : 0
}

resource "cloudflare_zone_setting" "setting_browser_check" {
  zone_id    = data.cloudflare_zone.domain.id
  setting_id = "browser_check"
  value      = lookup(var.zone_settings, "browser_check", null)
  count      = length(var.zone_settings) != 0 ? 1 : 0
}

resource "cloudflare_zone_setting" "setting_cache_level" {
  zone_id    = data.cloudflare_zone.domain.id
  setting_id = "cache_level"
  value      = lookup(var.zone_settings, "cache_level", null)
  count      = length(var.zone_settings) != 0 ? 1 : 0
}

resource "cloudflare_zone_setting" "setting_challenge_ttl" {
  zone_id    = data.cloudflare_zone.domain.id
  setting_id = "challenge_ttl"
  value      = lookup(var.zone_settings, "challenge_ttl", null)
  count      = length(var.zone_settings) != 0 ? 1 : 0
}

resource "cloudflare_zone_setting" "setting_cname_flattening" {
  zone_id    = data.cloudflare_zone.domain.id
  setting_id = "cname_flattening"
  value      = lookup(var.zone_settings, "cname_flattening", null)
  count      = length(var.zone_settings) != 0 ? 1 : 0
}

resource "cloudflare_zone_setting" "setting_development_mode" {
  zone_id    = data.cloudflare_zone.domain.id
  setting_id = "development_mode"
  value      = lookup(var.zone_settings, "development_mode", null)
  count      = length(var.zone_settings) != 0 ? 1 : 0
}

resource "cloudflare_zone_setting" "setting_email_obfuscation" {
  zone_id    = data.cloudflare_zone.domain.id
  setting_id = "email_obfuscation"
  value      = lookup(var.zone_settings, "email_obfuscation", null)
  count      = length(var.zone_settings) != 0 ? 1 : 0
}

resource "cloudflare_zone_setting" "setting_h2_prioritization" {
  zone_id    = data.cloudflare_zone.domain.id
  setting_id = "h2_prioritization"
  value      = lookup(var.zone_settings, "h2_prioritization", null)
  count      = length(var.zone_settings) != 0 ? 1 : 0
}

resource "cloudflare_zone_setting" "setting_hotlink_protection" {
  zone_id    = data.cloudflare_zone.domain.id
  setting_id = "hotlink_protection"
  value      = lookup(var.zone_settings, "hotlink_protection", null)
  count      = length(var.zone_settings) != 0 ? 1 : 0
}

resource "cloudflare_zone_setting" "setting_http2" {
  zone_id    = data.cloudflare_zone.domain.id
  setting_id = "http2"
  value      = lookup(var.zone_settings, "http2", null)
  count      = length(var.zone_settings) != 0 ? 1 : 0
}

resource "cloudflare_zone_setting" "setting_http3" {
  zone_id    = data.cloudflare_zone.domain.id
  setting_id = "http3"
  value      = lookup(var.zone_settings, "http3", null)
  count      = length(var.zone_settings) != 0 ? 1 : 0
}

resource "cloudflare_zone_setting" "setting_image_resizing" {
  zone_id    = data.cloudflare_zone.domain.id
  setting_id = "image_resizing"
  value      = lookup(var.zone_settings, "image_resizing", null)
  count      = length(var.zone_settings) != 0 ? 1 : 0
}

resource "cloudflare_zone_setting" "setting_ip_geolocation" {
  zone_id    = data.cloudflare_zone.domain.id
  setting_id = "ip_geolocation"
  value      = lookup(var.zone_settings, "ip_geolocation", null)
  count      = length(var.zone_settings) != 0 ? 1 : 0
}

resource "cloudflare_zone_setting" "setting_ipv6" {
  zone_id    = data.cloudflare_zone.domain.id
  setting_id = "ipv6"
  value      = lookup(var.zone_settings, "ipv6", null)
  count      = length(var.zone_settings) != 0 ? 1 : 0
}

resource "cloudflare_zone_setting" "setting_max_upload" {
  zone_id    = data.cloudflare_zone.domain.id
  setting_id = "max_upload"
  value      = lookup(var.zone_settings, "max_upload", null)
  count      = length(var.zone_settings) != 0 ? 1 : 0
}

resource "cloudflare_zone_setting" "setting_min_tls_version" {
  zone_id    = data.cloudflare_zone.domain.id
  setting_id = "min_tls_version"
  value      = lookup(var.zone_settings, "min_tls_version", null)
  count      = length(var.zone_settings) != 0 ? 1 : 0
}

resource "cloudflare_zone_setting" "setting_mirage" {
  zone_id    = data.cloudflare_zone.domain.id
  setting_id = "mirage"
  value      = lookup(var.zone_settings, "mirage", null)
  count      = length(var.zone_settings) != 0 ? 1 : 0
}

resource "cloudflare_zone_setting" "setting_opportunistic_encryption" {
  zone_id    = data.cloudflare_zone.domain.id
  setting_id = "opportunistic_encryption"
  value      = lookup(var.zone_settings, "opportunistic_encryption", null)
  count      = length(var.zone_settings) != 0 ? 1 : 0
}

resource "cloudflare_zone_setting" "setting_opportunistic_onion" {
  zone_id    = data.cloudflare_zone.domain.id
  setting_id = "opportunistic_onion"
  value      = lookup(var.zone_settings, "opportunistic_onion", null)
  count      = length(var.zone_settings) != 0 ? 1 : 0
}

resource "cloudflare_zone_setting" "setting_origin_error_page_pass_thru" {
  zone_id    = data.cloudflare_zone.domain.id
  setting_id = "origin_error_page_pass_thru"
  value      = lookup(var.zone_settings, "origin_error_page_pass_thru", null)
  count      = length(var.zone_settings) != 0 ? 1 : 0
}

resource "cloudflare_zone_setting" "setting_polish" {
  zone_id    = data.cloudflare_zone.domain.id
  setting_id = "polish"
  value      = lookup(var.zone_settings, "polish", null)
  count      = length(var.zone_settings) != 0 ? 1 : 0
}

resource "cloudflare_zone_setting" "setting_prefetch_preload" {
  zone_id    = data.cloudflare_zone.domain.id
  setting_id = "prefetch_preload"
  value      = lookup(var.zone_settings, "prefetch_preload", null)
  count      = length(var.zone_settings) != 0 ? 1 : 0
}

resource "cloudflare_zone_setting" "setting_privacy_pass" {
  zone_id    = data.cloudflare_zone.domain.id
  setting_id = "privacy_pass"
  value      = lookup(var.zone_settings, "privacy_pass", null)
  count      = length(var.zone_settings) != 0 ? 1 : 0
}

resource "cloudflare_zone_setting" "setting_pseudo_ipv4" {
  zone_id    = data.cloudflare_zone.domain.id
  setting_id = "pseudo_ipv4"
  value      = lookup(var.zone_settings, "pseudo_ipv4", null)
  count      = length(var.zone_settings) != 0 ? 1 : 0
}

resource "cloudflare_zone_setting" "setting_response_buffering" {
  zone_id    = data.cloudflare_zone.domain.id
  setting_id = "response_buffering"
  value      = lookup(var.zone_settings, "response_buffering", null)
  count      = length(var.zone_settings) != 0 ? 1 : 0
}

resource "cloudflare_zone_setting" "setting_rocket_loader" {
  zone_id    = data.cloudflare_zone.domain.id
  setting_id = "rocket_loader"
  value      = lookup(var.zone_settings, "rocket_loader", null)
  count      = length(var.zone_settings) != 0 ? 1 : 0
}

resource "cloudflare_zone_setting" "setting_security_level" {
  zone_id    = data.cloudflare_zone.domain.id
  setting_id = "security_level"
  value      = lookup(var.zone_settings, "security_level", null)
  count      = length(var.zone_settings) != 0 ? 1 : 0
}

resource "cloudflare_zone_setting" "setting_server_side_exclude" {
  zone_id    = data.cloudflare_zone.domain.id
  setting_id = "server_side_exclude"
  value      = lookup(var.zone_settings, "server_side_exclude", null)
  count      = length(var.zone_settings) != 0 ? 1 : 0
}

resource "cloudflare_zone_setting" "setting_sort_query_string_for_cache" {
  zone_id    = data.cloudflare_zone.domain.id
  setting_id = "sort_query_string_for_cache"
  value      = lookup(var.zone_settings, "sort_query_string_for_cache", null)
  count      = length(var.zone_settings) != 0 ? 1 : 0
}

resource "cloudflare_zone_setting" "setting_ssl" {
  zone_id    = data.cloudflare_zone.domain.id
  setting_id = "ssl"
  value      = lookup(var.zone_settings, "ssl", null)
  count      = length(var.zone_settings) != 0 ? 1 : 0
}

resource "cloudflare_zone_setting" "setting_tls_1_3" {
  zone_id    = data.cloudflare_zone.domain.id
  setting_id = "tls_1_3"
  value      = lookup(var.zone_settings, "tls_1_3", null)
  count      = length(var.zone_settings) != 0 ? 1 : 0
}

resource "cloudflare_zone_setting" "setting_tls_client_auth" {
  zone_id    = data.cloudflare_zone.domain.id
  setting_id = "tls_client_auth"
  value      = lookup(var.zone_settings, "tls_client_auth", null)
  count      = length(var.zone_settings) != 0 ? 1 : 0
}

resource "cloudflare_zone_setting" "setting_true_client_ip_header" {
  zone_id    = data.cloudflare_zone.domain.id
  setting_id = "true_client_ip_header"
  value      = lookup(var.zone_settings, "true_client_ip_header", null)
  count      = length(var.zone_settings) != 0 ? 1 : 0
}

resource "cloudflare_zone_setting" "setting_waf" {
  zone_id    = data.cloudflare_zone.domain.id
  setting_id = "waf"
  value      = lookup(var.zone_settings, "waf", null)
  count      = length(var.zone_settings) != 0 ? 1 : 0
}

resource "cloudflare_zone_setting" "setting_webp" {
  zone_id    = data.cloudflare_zone.domain.id
  setting_id = "webp"
  value      = lookup(var.zone_settings, "webp", null)
  count      = length(var.zone_settings) != 0 ? 1 : 0
}

resource "cloudflare_zone_setting" "setting_websockets" {
  zone_id    = data.cloudflare_zone.domain.id
  setting_id = "websockets"
  value      = lookup(var.zone_settings, "websockets", null)
  count      = length(var.zone_settings) != 0 ? 1 : 0
}

resource "cloudflare_zone_setting" "setting_zero_rtt" {
  zone_id    = data.cloudflare_zone.domain.id
  setting_id = "0rtt"
  value      = lookup(var.zone_settings, "zero_rtt", null)
  count      = length(var.zone_settings) != 0 ? 1 : 0
}

resource "cloudflare_zone_setting" "setting_minify" {
  zone_id    = data.cloudflare_zone.domain.id
  setting_id = "minify"
  value      = lookup(var.zone_settings, "minify", null)
  count      = length(var.zone_settings) != 0 ? 1 : 0
}

resource "cloudflare_zone_setting" "setting_mobile_redirect" {
  zone_id    = data.cloudflare_zone.domain.id
  setting_id = "mobile_redirect"
  value      = lookup(var.zone_settings, "mobile_redirect", null)
  count      = length(var.zone_settings) != 0 ? 1 : 0
}

resource "cloudflare_zone_setting" "setting_security_header" {
  zone_id    = data.cloudflare_zone.domain.id
  setting_id = "security_header"
  value      = lookup(var.zone_settings, "security_header", null)
  count      = length(var.zone_settings) != 0 ? 1 : 0
}

removed {
  from = cloudflare_zone_settings_override.setting
  lifecycle {
    destroy = false
  }
  # NOTE: The import blocks above are only valid in the root Terraform module.
  # If this file is a child module, move the import blocks to your root
  # module and prefix 'to' with the module path:
  #   to = module.mymod.cloudflare_zone_setting.setting_<setting>
}
