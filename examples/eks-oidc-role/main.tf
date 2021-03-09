data "aws_eks_cluster" "cluster" {
  name = var.eks_cluster_name
}

data "aws_partition" "current" {}

data "aws_caller_identity" "current" {}

module "oidc-provider-data" {
  source     = "reegnz/oidc-provider-data/aws"
  version    = "0.0.2"
  issuer_url = data.aws_eks_cluster.cluster.identity[0].oidc[0].issuer
}

resource "aws_iam_role" "role" {
  name               = var.role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

locals {
  oidc_provider_arn  = module.oidc-provider-data.arn
  oidc_provider_name = module.oidc-provider-data.name
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    principals {
      type = "Federated"
      identifiers = [
        local.oidc_provider_arn,
      ]
    }
    condition {
      test     = "StringEquals"
      variable = "${local.oidc_provider_name}:sub"
      values = [
        "system:serviceaccount:${var.eks_sa_namespace}:${var.eks_sa_name}"
      ]
    }
  }
}
