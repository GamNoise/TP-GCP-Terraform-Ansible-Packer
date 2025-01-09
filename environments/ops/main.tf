terraform {
  backend "gcs" {
    bucket = "terraform-state-ops"
    prefix = "terraform/ops"
  }
}
provider "google" {
  project = var.project_id
  region  = var.region
}

provider "google-beta" {
  project = var.project_id
  region  = var.region
}

module "storage" {
  source = "../../modules/storage"
  
  project_id     = var.project_id
  bucket_name    = var.artifact_registry_name
  location       = var.region
}

# Création du bucket pour les states Terraform
resource "google_storage_bucket" "terraform_state" {
  name          = "terraform-state-${var.project_id}"
  location      = var.region
  force_destroy = false

  versioning {
    enabled = true
  }

  uniform_bucket_level_access = true
}

# Configuration d'Artifact Registry
module "artifact_registry" {
  source = "../../modules/artifact_registry"
  
  project_id      = var.project_id
  location        = var.region
  repository_name = var.artifact_registry_name
}