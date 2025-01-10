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