variable "bucket_name" {
  description = "Name of the GCS bucket"
  type        = string
}

variable "location" {
  description = "Location of the GCS bucket (e.g., US, EU)"
  type        = string
  default     = "US"
}

variable "storage_class" {
  description = "Storage class of the GCS bucket (e.g., STANDARD, NEARLINE)"
  type        = string
  default     = "STANDARD"
}

variable "uniform_bucket_level_access" {
  description = "Whether to enable uniform bucket-level access"
  type        = bool
  default     = true
}

variable "lifecycle_age" {
  description = "Age in days after which objects are deleted"
  type        = number
  default     = 365
}

variable "versioning_enabled" {
  description = "Whether object versioning is enabled"
  type        = bool
  default     = false
}

variable "labels" {
  description = "A map of labels to assign to the bucket"
  type        = map(string)
  default     = {}
}
