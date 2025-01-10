variable "dns_zone_name" {
  description = "Name of the DNS zone"
  type        = string
}

variable "domain_name" {
  description = "Domain name for the zone"
  type        = string
}

variable "environment" {
  description = "Environment label for DNS"
  type        = string
}