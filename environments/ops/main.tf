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

module "artifact_registry" {
  source = "../../modules/artifact_registry"

  repository_name = var.artifact_registry_name
  location        = var.region

}

module "storage" {
  source = "../../modules/storage"
  bucket_name = "terraform-state-${var.project_id}"
  location    = var.region
  is_public   = false
  project_id  = var.project_id
  region      = var.region
}

module "monitoring" {
  source    = "../../modules/monitoring"
  project_id = var.project_id
}


resource "google_storage_bucket" "terraform_state" {
  name                        = "terraform-state-${var.project_id}"
  location                    = var.region
  force_destroy               = true
  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }
}

output "state_bucket_name" {
  value = google_storage_bucket.terraform_state.name
}
