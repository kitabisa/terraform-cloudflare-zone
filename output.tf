output "dns-record" {
  value       = cloudflare_dns_record.dns_record
  description = "List of DNS Record"
}

output "domain" {
  value       = data.cloudflare_zone.domain
  description = "Domain name"
}
