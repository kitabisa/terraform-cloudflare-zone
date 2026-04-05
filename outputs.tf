output "dns_record" {
  description = "Map of created DNS records"
  value       = cloudflare_dns_record.dns_record
}

output "zone" {
  description = "Cloudflare zone resource"
  value       = cloudflare_zone.domain
}

output "zone_id" {
  description = "Cloudflare zone ID"
  value       = cloudflare_zone.domain.id
}
