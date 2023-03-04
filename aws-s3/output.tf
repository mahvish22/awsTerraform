# S3 OUTPUT VARIABLE
output "arn" {
  description = "ID of project VPC"
  value       = module.s3-web.arn
}
output "name" {
  description = "Name or id of the S3 bucket"
  value       = module.s3-web.name
}
output "domain" {
  description = "Domain name of the S3 bucket"
  value       = module.s3-web.domain
}
output "endpoint" {
  description = "Endpoint of the S3 bucket"
  value       = module.s3-web.endpoint
}