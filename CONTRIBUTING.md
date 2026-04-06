# Contributing

Thank you for your interest in contributing to the Terraform Cloudflare Zone module!

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) >= 1.0
- [Cloudflare Provider](https://registry.terraform.io/providers/cloudflare/cloudflare) ~> 5.0

## Development

### Prerequisites for Local Development

1. Install [tfenv](https://github.com/tfutils/tfenv) or manually install Terraform
2. Install [terraform-docs](https://github.com/terraform-docs/terraform-docs)
3. Install [tflint](https://github.com/terraform-linters/tflint) (optional but recommended)

### Testing

Run the following commands to validate your changes:

```bash
# Format code
terraform fmt -recursive

# Validate configuration
terraform init
terraform validate

# Lint (optional)
tflint
```

### Generating Documentation

After modifying variables or outputs, regenerate the README:

```bash
terraform-docs ./...
```

## Pull Request Guidelines

1. **Follow Terraform style guide** - Use [HashiCorp Terraform Style Guide](https://developer.hashicorp.com/terraform/language/style)
2. **Use Cloudflare Provider v5** - Ensure compatibility with provider version 5.x
3. **Test your changes** - Include example configurations if adding new features
4. **Update documentation** - Keep README and examples in sync
5. **Use descriptive commit messages** - Explain what and why, not just what

## Code of Conduct

This project follows the [Contributor Covenant Code of Conduct](https://www.contributor-covenant.org/). By participating, you are expected to uphold this code.
