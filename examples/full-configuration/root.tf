module "cloudflare_zone" {
  source = "../../"

  zone_name  = var.zone_name
  account_id = var.account_id

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
    ssl              = "strict"
    always_use_https = "on"
    min_tls_version  = "1.2"
    tls_1_3          = "on"
    http3            = "on"
    brotli           = "on"
  }

  # Redirect Rules
  redirect_rules = [
    {
      name                  = "Redirect www to non-www"
      expression            = "(http.host eq \"www.example.com\")"
      target_url            = "https://example.com$1"
      status_code           = 301
      enabled               = true
      preserve_query_string = false
    }
  ]

  # Cache Rules
  cache_rules = [
    {
      name        = "Cache static assets"
      expression  = "(http.request.uri.path matches \"\\.(css|js|png|jpg|jpeg|gif|ico|svg|woff|woff2)$\")"
      cache       = true
      edge_ttl    = { mode = "override_origin", default = 86400 }
      browser_ttl = { mode = "respect_origin", default = 0 }
      enabled     = true
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
