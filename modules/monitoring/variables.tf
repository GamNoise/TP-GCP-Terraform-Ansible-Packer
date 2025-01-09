variable "project_id" {
  type        = string
  description = "ID du projet GCP"
}

variable "lb_id" {
  type        = string
  description = "ID du load balancer"
}

variable "mig_id" {
  type        = string
  description = "ID du managed instance group"
}