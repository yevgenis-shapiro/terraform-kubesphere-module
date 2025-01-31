variable "cluster_name" {
  description = "The kind cluster name."
  default     = "cluster-kubesphere"
  type        = string
}

variable "kind_cluster_config_path" {
  type        = string
  description = "The location where this cluster's kubeconfig will be saved to."
  default     = "~/.kube/config"
}

variable "kind_version" {
  description = "The kind version of kubernetes."
  default     = "v1.31.4"
  type        = string
}

variable "metallb_ip_range" {
  description = "The kind version of kubernetes."
  default     = "172.18.255.1-172.18.255.250"
  type        = string
}
