module "cloudflare_zone" {
  source = "../../"

  zone_name  = var.zone_name
  account_id = var.account_id

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
      name     = "@"
      type     = "MX"
      content  = "mail.example.com"
      priority = 10
      proxied  = false
    },
    {
      name    = "@"
      type    = "TXT"
      content = "v=spf1 mx a ~all"
      proxied = false
    }
  ]
}
