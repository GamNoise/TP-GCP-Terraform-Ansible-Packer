resource "google_storage_bucket" "static_assets" {
  name                        = var.bucket_name
  location                    = var.location
  storage_class               = var.storage_class
  uniform_bucket_level_access = var.uniform_bucket_level_access

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = var.lifecycle_age
    }
  }

  versioning {
    enabled = var.versioning_enabled
  }

  labels = var.labels
}

output "bucket_name" {
  value = google_storage_bucket.static_assets.name
}
