terraform {
  backend "gcs" {
    bucket = "terraform-state-app"
    prefix = "terraform/app"
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

module "networking" {
  source         = "../modules/networking"
  network_name   = var.network_name
  subnet_name    = var.subnet_name
  subnet_cidr    = var.subnet_cidr
  region         = var.region
}

module "compute" {
  source         = "../modules/compute"
  region         = var.region
  network_id     = module.networking.network_id
  subnet_id      = module.networking.primary_subnet_id
  lb_subnet_id   = module.networking.lb_subnet_id
  instance_image = var.instance_image
}


module "storage" {
  source          = "../modules/storage"
  bucket_name     = var.bucket_name
  location        = var.region
  is_public       = true
}

module "dns" {
  source          = "../modules/dns"
  dns_zone_name   = var.dns_zone_name
  domain_name     = var.domain_name
  environment     = var.environment
}

module "monitoring" {
  source          = "../modules/monitoring"
  project_id      = var.project_id
}

