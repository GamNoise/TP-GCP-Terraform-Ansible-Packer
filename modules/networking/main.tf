resource "google_compute_network" "vpc_network" {
  name                    = var.network_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnetwork" {
  name          = var.subnet_name
  region        = var.region
  network       = google_compute_network.vpc_network.id
  ip_cidr_range = var.subnet_cidr
}

output "network_id" {
  value = google_compute_network.vpc_network.id
}

output "subnet_id" {
  value = google_compute_subnetwork.subnetwork.id
}
