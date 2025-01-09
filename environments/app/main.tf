terraform {
  backend "gcs" {
    bucket = "your-terraform-state-bucket"
    prefix = "terraform/app"
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

module "networking" {
  source = "../../modules/networking"
  
  project_id    = var.project_id
  network_name  = var.network_name
  region        = var.region
  subnet_cidr   = var.subnet_cidr
  lb_subnet_cidr = var.lb_subnet_cidr
}

module "compute" {
  source = "../../modules/compute"
  
  project_id      = var.project_id
  region          = var.region
  network_id      = module.networking.network_id
  subnet_id       = module.networking.subnet_id
  instance_image  = var.instance_image
}

module "storage" {
  source = "../../modules/storage"
  
  project_id  = var.project_id
  bucket_name = var.static_bucket_name
  location    = var.region
  is_public   = true
}

module "dns" {
  source = "../../modules/dns"
  
  project_id     = var.project_id
  dns_zone_name  = var.dns_zone_name
  domain_name    = var.domain_name
}

module "monitoring" {
  source = "../../modules/monitoring"
  
  project_id = var.project_id
  lb_id      = module.compute.lb_id
  mig_id     = module.compute.mig_id
}
