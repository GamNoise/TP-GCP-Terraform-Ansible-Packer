resource "google_dns_managed_zone" "zone" {
  name        = var.dns_zone_name
  dns_name    = "${var.domain_name}."
  project     = var.project_id
  description = "Zone DNS managée pour ${var.domain_name}"
}

resource "google_dns_record_set" "app" {
  name         = "app.${google_dns_managed_zone.zone.dns_name}"
  managed_zone = google_dns_managed_zone.zone.name
  type         = "A"
  ttl          = 300
  project      = var.project_id

  rrdatas = [var.load_balancer_ip]
}
