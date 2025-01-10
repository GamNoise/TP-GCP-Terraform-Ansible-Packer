output "instance_name" {
  description = "Name of the VM instance"
  value       = google_compute_instance.vm_instance.name
}

# Module storage/main.tf
resource "google_storage_bucket" "static_assets" {
  name          = var.bucket_name
  location      = var.location
  storage_class = "STANDARD"

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 365
    }
  }

  versioning {
    enabled = true
  }

  uniform_bucket_level_access = var.is_public ? false : true
}

output "bucket_name" {
  value = google_storage_bucket.static_assets.name
}

# Module storage/variables.tf
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

# Module storage/outputs.tf
output "bucket_name" {
  description = "Name of the GCS bucket"
  value       = google_storage_bucket.static_assets.name
}
