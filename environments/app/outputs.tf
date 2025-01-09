output "load_balancer_ip" {
  value       = module.compute.load_balancer_ip
  description = "IP du load balancer"
}

output "static_bucket_url" {
  value       = module.storage.bucket_url
  description = "URL du bucket statique"
}

output "name_servers" {
  value       = module.dns.name_servers
  description = "Name servers de la zone DNS"
}