

variable "cluster_name" {
  description = "The kind cluster name."
  default     = "test-cluster2"
  type        = string
}

variable "kind_cluster_config_path" {
  type        = string
  description = "The location where this cluster's kubeconfig will be saved to."
  default     = "~/.kube/config"
}

variable "kind_version" {
  description = "The kind version of kubernetes."
  default     = "v1.32.0"
  type        = string
}
