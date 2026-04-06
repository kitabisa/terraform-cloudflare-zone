# Full Configuration Example

This example demonstrates a comprehensive Cloudflare zone setup with all features enabled:

- Zone creation with security settings
- DNS records
- Redirect rules using Cloudflare Rulesets
- Cache rules for edge caching
- Page rules for URL forwarding

## Features

### Zone Settings
- SSL: Strict
- Always use HTTPS: On
- Minimum TLS: 1.2
- TLS 1.3: On
- HTTP/3: On
- Brotli: On

### Redirect Rules
- Redirects `www.example.com` to `example.com`

### Cache Rules
- Caches static assets (CSS, JS, images) for 1 day at edge

### Page Rules
- Forwards `/blog/*` to `https://blog.example.com/*`

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
