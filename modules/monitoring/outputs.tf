output "dashboard_id" {
  description = "ID of the Monitoring Dashboard"
  value       = google_monitoring_dashboard.app_dashboard.id
}