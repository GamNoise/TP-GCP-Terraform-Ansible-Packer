variable "project_id" {
  type        = string
  description = "ID du projet GCP pour Ops"
}

variable "region" {
  type        = string
  description = "Région GCP"
  default     = "europe-west9"
}

variable "artifact_registry_name" {
  type        = string
  description = "Nom de l'Artifact Registry"
}
