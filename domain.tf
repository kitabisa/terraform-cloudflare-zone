data "cloudflare_zone" "domain" {
  filter = {
    name = var.zone_name
  }
}

resource "cloudflare_zone" "domain" {
  account = {
    id = var.account_id
  }
  name = var.zone_name
}
