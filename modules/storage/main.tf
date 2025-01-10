resource "google_storage_bucket" "static_assets" {
  name                        = var.bucket_name
  location                    = var.location
  storage_class               = "STANDARD"

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

  dynamic "website" {
    for_each = var.is_public ? [1] : []
    content {
      main_page_suffix = "index.html"
      not_found_page   = "404.html"
    }
  }
}

resource "google_storage_bucket_iam_member" "public_access" {
  count  = var.is_public ? 1 : 0
  bucket = google_storage_bucket.static_assets.name
  role   = "roles/storage.objectViewer"
  member = "allUsers"
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


output "bucket_name" {
  value = google_storage_bucket.static_assets.name
}
