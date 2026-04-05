locals {
  redirect_rules = var.redirect_rules != null ? {
    for rr in var.redirect_rules :
    join("/", [var.zone_name, substr(uuidv5("dns", rr.name), 0, 8)]) => rr
  } : {}
}

# Single Redirects resource
resource "cloudflare_ruleset" "single_redirects" {
  count   = length(local.redirect_rules) != 0 ? 1 : 0
  zone_id = data.cloudflare_zone.domain.id

  name  = "default"
  kind  = "zone"
  phase = "http_request_dynamic_redirect"

  rules = [for rules in local.redirect_rules : {
    action      = "redirect"
    description = lookup(rules, "name", null)
    enabled     = lookup(rules, "enabled", false)
    expression  = lookup(rules, "expression", "/")
    action_parameters = {
      from_value = {
        preserve_query_string = lookup(rules, "preserve_query_string", false)
        status_code           = lookup(rules, "status_code", 301)
        target_url = {
          value = lookup(rules, "target_url", "/")
        }
      }
    }
  }]
}
