packer {
  required_plugins {
    amazon = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

locals {
  timestamp = regex_replace(timestamp(), "[- TZ:]", "")
}

source "amazon-ebs" "linux-packer" {
  ami_name      = "linux-packer-${local.timestamp}"
  instance_type = "t2.micro"
  region        = "us-west-2"
  source_ami_filter {
    filters = {
      name                = "amzn2-ami-hvm-2.*.1-x86_64-gp2"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["amazon"] 
  }
  ssh_username = "ec2-user"
}

build {
  name    = "learn-packer"
  sources = [
    "source.amazon-ebs.linux-packer"
  ]


  provisioner "shell" {
    script = "./test_script.sh"
  }
}
