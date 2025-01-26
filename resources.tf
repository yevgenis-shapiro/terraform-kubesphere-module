
data "external" "subnet" {
  program = ["/bin/bash", "-c", "docker network inspect -f '{{json .IPAM.Config}}' kind | jq .[0]"]
  depends_on = [
    kind_cluster.default
  ]
}

provider "helm" {
  kubernetes {
    config_path = pathexpand(var.kind_cluster_config_path)
  }
}

module "metallb" {
  source = "./modules/metallb"
  depends_on = [kind_cluster.default]
  kind_cluster_config_path = var.kind_cluster_config_path
  #version  = var.metallb_helm_version
}

module "nginx" {
  source = "./modules/nginx"
  #depends_on = [kind_cluster.default]
  depends_on = [module.metallb]
  #ingress_nginx_helm_version = var.ingress_nginx_helm_version
  #ingress_nginx_namespace    = var.ingress_nginx_namespace

}


