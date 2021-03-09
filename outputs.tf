output "name" {
  description = "The OIDC issuer name."
  value       = local.url_stripped
}

output "arn" {
  description = "The ARN that the provider will have with the given issuer URL."
  value       = local.arn
}
