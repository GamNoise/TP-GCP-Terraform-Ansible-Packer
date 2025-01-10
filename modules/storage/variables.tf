variable "bucket_name" {
  description = "Name of the GCS bucket"
  type        = string
}

variable "location" {
  description = "Location of the GCS bucket"
  type        = string
}

variable "is_public" {
  description = "Whether the bucket is public"
  type        = bool
}

variable "region" {
  description = "Region for the subnetwork"
  type        = string
}

variable "project_id" {
  type        = string
  description = "ID du projet GCP pour Ops"
}