variable "project_id" {
  type        = string
  description = "ID du projet GCP pour App"
}

variable "region" {
  type        = string
  description = "Région GCP"
  default     = "europe-west9"
}

variable "network_name" {
  type        = string
  description = "Nom du VPC"
}

variable "subnet_cidr" {
  type        = string
  description = "CIDR du subnet principal"
}

variable "lb_subnet_cidr" {
  type        = string
  description = "CIDR du subnet pour le load balancer"
}

variable "static_bucket_name" {
  type        = string
  description = "Nom du bucket pour les fichiers statiques"
}

variable "instance_image" {
  type        = string
  description = "Image de l'instance"
}

variable "dns_zone_name" {
  type        = string
  description = "Nom de la zone DNS"
}

variable "domain_name" {
  type        = string
  description = "Nom de domaine"
}