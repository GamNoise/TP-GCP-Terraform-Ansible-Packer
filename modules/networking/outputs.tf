output "network_id" {
  value       = google_compute_network.vpc.id
  description = "ID du VPC"
}

output "subnet_id" {
  value       = google_compute_subnetwork.subnet.id
  description = "ID du subnet principal"
}

output "lb_subnet_id" {
  value       = google_compute_subnetwork.lb_subnet.id
  description = "ID du subnet du load balancer"
}