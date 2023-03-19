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

variable "vault_address" {
  description = "Vault endpoint address"
  default = "http://127.0.0.1:8200"
}

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
variable private_key{
 default = "packer.pem"
}