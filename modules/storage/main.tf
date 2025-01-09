resource "google_storage_bucket" "bucket" {
  name          = var.bucket_name
  location      = var.location
  project       = var.project_id
  force_destroy = true

  uniform_bucket_level_access = true

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
  bucket = google_storage_bucket.bucket.name
  role   = "roles/storage.objectViewer"
  member = "allUsers"
}