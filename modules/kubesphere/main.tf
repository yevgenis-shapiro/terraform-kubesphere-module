resource "helm_release" "kubesphere" {
  name       = "kubesphere"
  namespace  = "kubesphere-system"
  repository = "https://charts.kubesphere.io/main"
  chart      = "ks-core"
  version    = "0.4.0"
  create_namespace = true

  values = [
    "${file("modules/kubesphere/ks-values.yaml")}"
  ]
}
