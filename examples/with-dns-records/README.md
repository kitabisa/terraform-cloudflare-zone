# DNS Records Example

This example demonstrates creating a Cloudflare zone with DNS records.

## DNS Records Created

| Name | Type | Content | Proxied |
|------|------|---------|---------|
| www | CNAME | example.herokuapp.com | true |
| @ | A | 192.0.2.1 | false |
| @ | MX | mail.example.com | false |
| @ | TXT | v=spf1 mx a ~all | false |

## Usage

```hcl
terraform init
terraform plan -var="cloudflare_api_token=YOUR_API_TOKEN" -var="account_id=YOUR_ACCOUNT_ID"
terraform apply -var="cloudflare_api_token=YOUR_API_TOKEN" -var="account_id=YOUR_ACCOUNT_ID"
```

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0 |
| cloudflare | ~> 5.0 |
