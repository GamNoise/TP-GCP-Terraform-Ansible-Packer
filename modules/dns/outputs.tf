output "dns_zone_name" {
  description = "Name of the DNS zone"
  value       = google_dns_managed_zone.primary.name
}
