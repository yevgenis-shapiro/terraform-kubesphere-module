resource "helm_release" "kubesphere" {
  name       = "kubesphere"
  namespace  = "kubesphere-system"
  repository = "https://charts.kubesphere.io/main"
  chart      = "ks-installer"
  version    = "0.3.0"
  create_namespace = true

  values = [
    "${file("modules/kubesphere/ks-values.yaml")}"
  ]
}
