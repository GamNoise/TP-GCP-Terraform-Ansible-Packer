resource "google_artifact_registry_repository" "repo" {
  name         = var.repository_name
  format       = "DOCKER"
  location     = var.location
}

output "repository_name" {
  value = google_artifact_registry_repository.repo.name
}