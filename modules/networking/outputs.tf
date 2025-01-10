output "network_id" {
  description = "ID of the VPC network"
  value       = google_compute_network.vpc_network.id
}

output "subnet_id" {
  description = "ID of the subnetwork"
  value       = google_compute_subnetwork.subnetwork.id
}
