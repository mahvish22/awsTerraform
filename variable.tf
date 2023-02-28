variable "pv_subnets" {
  description = "The private subnet"
}

variable "pb_subnets" {
  description = "The public subnet"
}
variable "keypair_name" {
  description = "Keypair name"
}

variable "avail_zone" {}

/*variable "instanceType" {
  description = "Type of ec2"
  type = list(string)
  default = ["t2.micro", "t2.large"]
}  

variable "instanceType" {
  description = "Type of ec2"
  type = map(string)
  default = {
    "small-app" = "t2.micro"
     "large-app"="t2.large"
     }
}*/
variable "instance_ty" {
  description = "Type of ec2"
  default = "t2.micro"
}
/*
variable "instance_ty" {
  description = "Type of ec2"
  type = map(string)
  default = {
    "small-app" = "t2.micro"
     "large-app"="t2.large"
     }
}

variable "ec2_count" {
  description = "Numbers of ec2"
 }
 */

variable "website_bucket_name" {
  description = "Name of backend bucket"
  type = string
  default = "mahvish"
}

variable "tag_name" {
  description = "Name of tag of S3 `bucket"
  default = "static_website"
}

variable private_key{
 default = "packer.pem"
}