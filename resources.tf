
data "external" "subnet" {
  program = ["/bin/bash", "-c", "docker network inspect -f '{{json .IPAM.Config}}' kind | jq .[0]"]
  depends_on = [
    kind_cluster.default
  ]
}


module "metallb" {
  source = "./modules/metallb"

  #version  = var.metallb_helm_version

}


module "nginx" {
  source = "./modules/nginx"

  #ingress_nginx_helm_version = var.ingress_nginx_helm_version
  #ingress_nginx_namespace    = var.ingress_nginx_namespace

}


