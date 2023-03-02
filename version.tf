terraform {

  required_version = ">= 1.3.0"

  # backend contains your state file
   backend "s3" {
    region = "us-west-2"
    acl    = "public-read"
    bucket = "awsbackend"
    key    = "test/terraform.tfstate"
  } 

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.56.0"
    }

     }
}

# Provider-1 for us-west-2
provider "aws" {
 // version = "~> 4.56.0"
  region  = "us-west-2"
}

/*Provider-2 for us-east-1
provider "aws" {
  version = "~> 4.56.0"
  region  = "us-east-1"
  alias   = "aws-east-1" 
} */