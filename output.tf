# EC2 OUTPUT VARIABLE
output "vpc_id" {
  description = "ID of project VPC"
  value       = module.vpc.vpc_id
}

/*output "web_server_count" {
  description = "Number of web servers provisioned"
  value       = length(aws_instances.packer.id)
}*/
output "public_ip" {
  description = "Public IP address"
  value       =  aws_instance.packer_test.*.public_ip
}

output "private_ip" {
  description = "Private IP address"
  value       =  aws_instance.packer_test.*.private_ip
}
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