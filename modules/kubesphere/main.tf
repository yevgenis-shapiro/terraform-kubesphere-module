resource "helm_release" "ks_installer" {
  name       = "ks-installer"
  namespace  = "kubesphere-system"
  repository = "https://charts.kubesphere.io/main"
  chart      = "ks-installer"
  version    = "4.1.2"

  create_namespace = true

  values = [
    "${file("./ks-values.yaml")}"
  ]
}
