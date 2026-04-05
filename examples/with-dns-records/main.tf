terraform {
  required_version = ">= 1.0"

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5.0"
    }
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

variable "cloudflare_api_token" {
  description = "Cloudflare API token"
  type        = string
  sensitive   = true
}

variable "zone_name" {
  description = "DNS Zone name"
  type        = string
  default     = "example.com"
}

variable "account_id" {
  description = "Cloudflare account ID"
  type        = string
  default     = ""
}

output "zone_id" {
  description = "Zone ID"
  value       = module.cloudflare_zone.zone_id
}

output "dns_records" {
  description = "Created DNS records"
  value       = module.cloudflare_zone.dns_record
}
