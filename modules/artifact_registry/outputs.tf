output "repository_name" {
  description = "Name of the artifact repository"
  value       = google_artifact_registry_repository.repo.name
}