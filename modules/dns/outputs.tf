output "name_servers" {
  value       = google_dns_managed_zone.zone.name_servers
  description = "Name servers de la zone DNS"
}