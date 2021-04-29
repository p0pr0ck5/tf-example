terraform {
  required_version = ">= 0.13.5"

  required_providers {
    random = {
      source = "hashicorp/random"
      version = "~> 2.3"
    }
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_elb" "e" {
  name               = "foobar-terraform-elb"
  availability_zones = ["us-west-2a", "us-west-2b", "us-west-2c"]
  listener {
    instance_port     = 8000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
}

resource "random_pet" "pet" {}
resource "random_pet" "other_pet" {}

output "pet" {
  value = random_pet.pet.id
}

output "other_pet" {
  value = random_pet.other_pet.id
}
