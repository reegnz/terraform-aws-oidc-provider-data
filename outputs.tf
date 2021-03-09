output "issuer_url" {
  description = "The OIDC issuer URL."
  value       = var.issuer_url
}

output "arn" {
  description = "The ARN that the provider will have with the given issuer URL."
  value       = local.arn
}
