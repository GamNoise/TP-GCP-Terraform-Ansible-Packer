output "instance_group_id" {
  value       = google_compute_region_instance_group_manager.mig.instance_group
  description = "ID du groupe d'instances"
}

output "load_balancer_ip" {
  value       = google_compute_forwarding_rule.forwarding_rule.ip_address
  description = "IP du load balancer"
}
