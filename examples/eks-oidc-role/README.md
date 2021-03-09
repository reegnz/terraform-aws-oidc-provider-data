# eks-oidc-role

Creates an AWS IAM Role to be used with EKS service accounts.

Details:
https://docs.aws.amazon.com/eks/latest/userguide/iam-roles-for-service-accounts.html
https://docs.aws.amazon.com/eks/latest/userguide/iam-roles-for-service-accounts-technical-overview.html

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

| Name | Source | Version |
|------|--------|---------|
| oidc-provider-data | reegnz/oidc-provider-data/aws | 0.0.2 |

## Resources

| Name |
|------|
| [aws_caller_identity](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) |
| [aws_eks_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster) |
| [aws_iam_policy_document](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) |
| [aws_iam_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) |
| [aws_partition](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| eks\_cluster\_name | The cluster name to allow assume from. | `string` | n/a | yes |
| eks\_sa\_name | The k8s service account name to allow assume from. | `string` | n/a | yes |
| eks\_sa\_namespace | The k8s service account namespace to allow assume from. | `string` | n/a | yes |
| role\_name | The role name. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| role\_arn | The role ARN |
| role\_name | The name of the role |
