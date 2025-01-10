variable "instance_name" {
  description = "Name of the VM instance"
  type        = string
}

variable "machine_type" {
  description = "Type of machine for the instance"
  type        = string
}

variable "zone" {
  description = "Zone for the instance"
  type        = string
}

variable "instance_image" {
  description = "Image for the instance"
  type        = string
}

variable "network_id" {
  description = "ID of the VPC network"
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnetwork"
  type        = string
}

variable "region" {
  description = "Region for compute resources"
  type        = string
}

variable "lb_subnet_id" {
  description = "ID of the load balancer subnetwork"
  type        = string
}
