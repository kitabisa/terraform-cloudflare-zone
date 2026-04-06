locals {
  cache_rules = var.cache_rules != null ? {
    for cr in var.cache_rules :
    join("/", [var.zone_name, substr(uuidv5("dns", cr.name), 0, 8)]) => cr
  } : {}
  cache_rules_params = {
    for k, rule in local.cache_rules : k => {
      action      = "set_cache_settings"
      description = rule.name
      enabled     = rule.enabled
      expression  = rule.expression
      action_parameters = merge(
        { cache = rule.cache },
        rule.browser_ttl != null ? { browser_ttl = { default = try(rule.browser_ttl.default, null), mode = rule.browser_ttl.mode } } : {},
        rule.edge_ttl != null ? { edge_ttl = { default = rule.edge_ttl.default, mode = rule.edge_ttl.mode } } : {}
      )
    }
  }
}

resource "cloudflare_ruleset" "cache_config" {
  count = length(local.cache_rules_params) != 0 ? 1 : 0

  kind    = "zone"
  name    = "cache-rules"
  phase   = "http_request_cache_settings"
  zone_id = cloudflare_zone.domain.id

  rules = values(local.cache_rules_params)
}
