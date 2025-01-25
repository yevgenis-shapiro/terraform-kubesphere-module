

resource "helm_release" "ingress_nginx" {
  name       = "ingress-nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  version    = var.ingress_nginx_helm_version

  namespace        = var.ingress_nginx_namespace
  create_namespace = true
  timeout = 300

  values = [
    <<EOT
controller:
  updateStrategy:
    type: "RollingUpdate"
    rollingUpdate:
      maxUnavailable: 1
  hostPort:
    enabled: true
  terminationGracePeriodSeconds: 0
  service:
    type: "LoadBalancer"
  watchIngressWithoutClass: true
  nodeSelector:
    ingress-ready: "true"
  tolerations:
    - key: "node-role.kubernetes.io/master"
      operator: "Equal"
      effect: "NoSchedule"
  publishService:
    enabled: true
EOT
  ]

}

