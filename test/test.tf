terraform {
  required_providers {
    testing = {
      source  = "apparentlymart/testing"
      version = "0.0.2"
    }
  }
}

resource "aws_iam_openid_connect_provider" "example" {
  url = "https://example.com"
  client_id_list = [
    "sts.amazonaws.com",
  ]

  thumbprint_list = [
    "1234567890123456789012345678901234567890",
  ]
}

module "mut" { # module under test
  source     = "../"
  issuer_url = "https://example.com"
}



data "testing_assertions" "assert" {
  equal "arn" {
    statement = "constructs an IAM OIDC provider ARN based on an OIDC issuer URL"
    got       = module.mut.arn
    want      = aws_iam_openid_connect_provider.example.arn
  }

  equal "name" {
    statement = "trims https:// from the provider url"
    got       = module.mut.name
    want      = "example.com"
  }
}
