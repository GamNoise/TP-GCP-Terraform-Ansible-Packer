resource "google_monitoring_dashboard" "dashboard" {
  project        = var.project_id
  dashboard_json = jsonencode({
    displayName = "Application Dashboard"
    gridLayout = {
      columns = 2
      widgets = [
        {
          title = "Load Balancer Requests"
          xyChart = {
            dataSets = [{
              timeSeriesQuery = {
                timeSeriesFilter = {
                  filter = "metric.type=\"loadbalancing.googleapis.com/https/request_count\" resource.type=\"https_lb_rule\" resource.label.url_map_name=\"${var.lb_id}\""
                }
              }
            }]
          }
        },
        {
          title = "Instance Group CPU Usage"
          xyChart = {
            dataSets = [{
              timeSeriesQuery = {
                timeSeriesFilter = {
                  filter = "metric.type=\"compute.googleapis.com/instance/cpu/utilization\" resource.type=\"gce_instance\" metadata.user_labels.managed-by-mig=\"${var.mig_id}\""
                }
              }
            }]
          }
        },
        {
          title = "RAM Usage"
          xyChart = {
            dataSets = [{
              timeSeriesQuery = {
                timeSeriesFilter = {
                  filter = "metric.type=\"agent.googleapis.com/memory/percent_used\" resource.type=\"gce_instance\" metadata.user_labels.managed-by-mig=\"${var.mig_id}\""
                }
              }
            }]
          }
        }
      ]
    }
  })
}
