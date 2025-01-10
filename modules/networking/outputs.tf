output "network_id" {
  description = "ID of the VPC network"
  value       = google_compute_network.vpc_network.id
}

output "subnet_id" {
  description = "ID of the subnetwork"
  value       = google_compute_subnetwork.subnetwork.id
}

output "lb_subnet_id" {
  description = "ID of the Load Balancer subnetwork"
  value       = google_compute_subnetwork.lb_subnetwork.id
}
