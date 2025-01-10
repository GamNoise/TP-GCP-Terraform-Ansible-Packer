resource "google_monitoring_dashboard" "app_dashboard" {
  dashboard_json = jsonencode({
    name     = "App Monitoring Dashboard"
    widgets  = [
      {
        text = {
          content = "Traffic from Load Balancer"
          style   = "HEADER"
        }
      },
      {
        metric = {
          type = "compute.googleapis.com/instance/cpu/utilization"
        }
      }
    ]
  })
}