
module "metallb" {
  source = "./modules/metallb"

  project             = var.project
  network             = google_compute_network.k3s.self_link
  region              = var.servers.region
  cidr_range          = var.servers.cidr_range
  machine_type        = var.servers.machine_type
  target_size         = var.servers.target_size
  authorized_networks = var.servers.authorized_networks
  service_account     = google_service_account.k3s-server.email

}


module "nginx" {
  source = "./modules/nginx"

  version             = var.ingress_nginx_helm_version
  network             = google_compute_network.k3s.self_link
  region              = var.servers.region
  cidr_range          = var.servers.cidr_range
  machine_type        = var.servers.machine_type
  target_size         = var.servers.target_size
  authorized_networks = var.servers.authorized_networks
  service_account     = google_service_account.k3s-server.email

}


module "kubesphere" {
  source = "./modules/kubesphere"

  project             = var.project
  network             = google_compute_network.k3s.self_link
  region              = var.servers.region
  cidr_range          = var.servers.cidr_range
  machine_type        = var.servers.machine_type
  target_size         = var.servers.target_size
  authorized_networks = var.servers.authorized_networks
  service_account     = google_service_account.k3s-server.email

}





