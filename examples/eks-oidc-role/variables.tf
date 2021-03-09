variable "eks_cluster_name" {
  description = "The cluster name to allow assume from."
  type        = string
}

variable "eks_sa_namespace" {
  description = "The k8s service account namespace to allow assume from."
  type        = string
}

variable "eks_sa_name" {
  description = "The k8s service account name to allow assume from."
  type        = string
}

variable "role_name" {
  description = "The role name."
  type        = string
}
