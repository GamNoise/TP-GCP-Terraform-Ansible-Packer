variable "project_id" {
  type        = string
  description = "ID du projet GCP"
}

variable "dns_zone_name" {
  type        = string
  description = "Nom de la zone DNS"
}

variable "domain_name" {
  type        = string
  description = "Nom de domaine"
}

variable "load_balancer_ip" {
  type        = string
  description = "IP du load balancer"
}