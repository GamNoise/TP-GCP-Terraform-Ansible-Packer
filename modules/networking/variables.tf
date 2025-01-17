variable "network_name" {
  description = "Name of the VPC network"
  type        = string
}

variable "subnet_name" {
  description = "Name of the subnetwork"
  type        = string
}

variable "region" {
  description = "Region for the subnetwork"
  type        = string
}

variable "subnet_cidr" {
  description = "CIDR range for the subnetwork"
  type        = string
}

variable "lb_subnet_name" {
  description = "Name of the load balancer subnetwork"
  type        = string
}

variable "lb_subnet_cidr" {
  description = "CIDR range for the load balancer subnetwork"
  type        = string
}
