# aws-oidc-provider-data Terraform Module

This module is for generating the OpenID Connect provider ARN one would get
given an issuer url.

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.14 |
| aws | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 3.0 |

## Modules

No Modules.

## Resources

| Name |
|------|
| [aws_caller_identity](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) |
| [aws_partition](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | The OIDC issuer name. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| arn | The ARN that the provider will have with the given issuer URL. |
| issuer\_url | The OIDC issuer URL. |
