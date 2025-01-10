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
  source = "./modules/networking"

  vpc_name = var.vpc_name
  subnets = [
    {
      name       = "app-subnet"
      region     = "europe-west9"
      cidr_block = "10.0.0.0/24"
    },
    {
      name       = "lb-subnet"
      region     = "europe-west9"
      cidr_block = "10.0.1.0/24"
    }
  ]

  labels = {
    environment = var.environment
    project     = var.project
  }
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
  source = "./modules/storage"

  bucket_name = var.terraform_state_bucket
  location    = var.region

  versioning = {
    enabled = true
  }

  iam_configuration = {
    uniform_bucket_level_access = true
  }

  labels = {
    environment = var.environment
    project     = var.project
  }
}

module "dns" {
  source          = "../modules/dns"
  dns_zone_name   = var.dns_zone_name
  domain_name     = var.domain_name
  environment     = var.environment
}

module "monitoring" {
  source = "./modules/monitoring"

  metrics = [
    "traffic_load_balancer",
    "cpu_usage",
    "memory_usage",
    "http_5xx_errors",
    "latency_load_balancer"
  ]

  labels = {
    environment = var.environment
    project     = var.project
  }
}

