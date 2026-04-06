# Basic Example

This example demonstrates creating a basic Cloudflare zone with no additional configuration.

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
