
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "10.0.0.0/16"
  #provider = aws.aws-east-1

  azs             = var.avail_zone
  private_subnets = var.pv_subnets
  public_subnets  = var.pb_subnets

  enable_nat_gateway = false
  enable_vpn_gateway = false
  map_public_ip_on_launch = true

  tags = {
   # Name = "${terraform.workspace}-packerVPC"
   Name = "packerVPC"
  }
}


