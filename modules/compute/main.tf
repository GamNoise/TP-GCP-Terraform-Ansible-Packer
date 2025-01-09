resource "google_compute_instance_template" "template" {
  name_prefix  = "app-template-"
  machine_type = "e2-medium"
  
  disk {
    source_image = var.instance_image
    auto_delete  = true
    boot         = true
  }
  
  network_interface {
    subnetwork = var.subnet_id
  }
  
  lifecycle {
    create_before_destroy = true
  }
}

resource "google_compute_region_instance_group_manager" "mig" {
  name = "app-mig"
  
  base_instance_name = "app"
  region            = var.region
  
  version {
    instance_template = google_compute_instance_template.template.id
  }
  
  target_size = 2
  
  named_port {
    name = "http"
    port = 8080
  }
}

resource "google_compute_region_health_check" "health_check" {
  name = "app-health-check"
  
  http_health_check {
    port = 8080
  }
}

resource "google_compute_region_backend_service" "backend" {
  name                  = "app-backend"
  protocol              = "HTTP"
  load_balancing_scheme = "INTERNAL_MANAGED"
  
  backend {
    group = google_compute_region_instance_group_manager.mig.instance_group
  }
  
  health_checks = [google_compute_region_health_check.health_check.id]
}

resource "google_compute_region_url_map" "url_map" {
  name            = "app-url-map"
  default_service = google_compute_region_backend_service.backend.id
}

resource "google_compute_region_target_http_proxy" "proxy" {
  name    = "app-proxy"
  url_map = google_compute_region_url_map.url_map.id
}

resource "google_compute_forwarding_rule" "forwarding_rule" {
  name                  = "app-forwarding-rule"
  load_balancing_scheme = "INTERNAL_MANAGED"
  port_range            = "80"
  target                = google_compute_region_target_http_proxy.proxy.id
  network               = var.network_id
  subnetwork            = var.lb_subnet_id
}