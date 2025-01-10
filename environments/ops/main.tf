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
  source = "./modules/artifact_registry"

  name        = var.registry_name
  location    = var.region
  description = "Artifact registry for Go binaries"

  labels = {
    environment = var.environment
    project     = var.project
  }
}

module "storage" {
  source = "./modules/storage"

  bucket_name = var.terraform_state_bucket
  location    = var.region

  versioning = {
    enabled = true
  }

  iam_configuration = {
    uniform_bucket_level_access = true
  }

  labels = {
    environment = var.environment
    project     = var.project
  }
}

module "monitoring" {
  source = "./modules/monitoring"

  metrics = [
    "traffic_load_balancer",
    "cpu_usage",
    "memory_usage",
    "http_5xx_errors",
    "latency_load_balancer"
  ]

  labels = {
    environment = var.environment
    project     = var.project
  }
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
