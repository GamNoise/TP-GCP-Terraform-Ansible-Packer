resource "google_dns_managed_zone" "primary" {
  name        = var.dns_zone_name
  dns_name    = var.domain_name
  description = "Primary DNS zone"

  labels = {
    environment = var.environment
  }
}

output "dns_zone_name" {
  value = google_dns_managed_zone.primary.name
}