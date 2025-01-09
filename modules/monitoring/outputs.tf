output "dashboard_name" {
  value       = google_monitoring_dashboard.dashboard.dashboard_json
  description = "Nom du dashboard de monitoring"
}