data "aws_partition" "current" {}

data "aws_caller_identity" "current" {}

locals {
  partition    = data.aws_partition.current.id
  account_id   = data.aws_caller_identity.current.account_id
  url_stripped = replace(var.issuer_url, "https://", "")
  arn          = "arn:${local.partition}:iam::${local.account_id}:oidc-provider/${local.url_stripped}"
}
