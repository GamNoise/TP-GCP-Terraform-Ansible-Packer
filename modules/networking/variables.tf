variable "project_id" {
  type        = string
  description = "ID du projet GCP"
}

variable "network_name" {
  type        = string
  description = "Nom du VPC"
}

variable "subnet_cidr" {
  type        = string
  description = "CIDR du subnet principal"
}

variable "region" {
  type        = string
  description = "Région GCP"
}