locals {
  records = var.records != null ? {
    for record in var.records :
    join("/", [record.name, record.type, substr(uuidv5("dns", record.content), 0, 8)]) => record
  } : {}
}


resource "cloudflare_dns_record" "dns_record" {
  for_each = local.records

  zone_id = cloudflare_zone.domain.id

  name     = each.value.name
  type     = each.value.type
  proxied  = each.value.proxied
  ttl      = each.value.ttl
  priority = each.value.priority
  content  = each.value.content
}

moved {
  from = cloudflare_record.dns_record
  to   = cloudflare_dns_record.dns_record
}
