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

module "storage" {
  source = "../../modules/storage"
  
  project_id     = var.project_id
  bucket_name    = var.artifact_registry_name
  location       = var.region
}