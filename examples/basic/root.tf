module "cloudflare_zone" {
  source = "../../"

  zone_name  = var.zone_name
  account_id = var.account_id
}
