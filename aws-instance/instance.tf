data "aws_security_group" "selected" {
  id = aws_security_group.packerSecurity.id
}
resource "aws_security_group" "packerSecurity" {
  name        = "packerSecurity"
  description = "Allow web traffics"
  vpc_id      = module.vpc.vpc_id

  ingress = [
    {
      description      = "HTTP"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = []
      security_groups  = []
      self             = true
    },

    {
      description      = "SSH"
      from_port        = 8080
      to_port          = 8080
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = []
      security_groups  = []
      self             = true
    }
  ]

  egress = [
    {
      description      = "for all outgoing traffics"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      prefix_list_ids  = []
      ipv6_cidr_blocks = ["::/0"]
      security_groups  = []
      self             = true
    }
  ]

  tags = {
    #Name = "${terraform.workspace}-packerSecurityGrp"
    Name = "packerSecurityGrp"
  }
}

data "aws_ami" "packer_ami" {
  most_recent = true
  owners      = ["667635345505"]

  filter {
    name   = "name"
    values = ["linux-packer-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "packer_test" {
  ami           = data.aws_ami.packer_ami.id
  instance_type = var.instance_ty
  key_name = var.keypair_name
  vpc_security_group_ids = [data.aws_security_group.selected.id]
  subnet_id = module.vpc.public_subnets[0]
  count = 1
  #count = terraform.workspace == "default" ? 1:2

  //instance_type = var.instanceType[0] //incase of List
 # instance_type = var.instanceType["small-app"] //incase of map
  #user_data = file ("initial_step.sh")
  tags = {
   # Name = "packerWorld-${terraform.workspace}-${count.index}"
   Name = "packerWorld-${count.index}"
  }
}

resource "null_resource" "copy-test-file"{
provisioner "file" {
  source      = "C:/users/absar/Downloads/Dodgeball-KS2.txt"
  destination = "/tmp"
  on_failure = continue
}

connection {
    type     = "ssh"
    user     = "ec2-user"
    password = ""
    host     = "self.public_ip"
    private_key = "file(var.private_key)"
  }
}
