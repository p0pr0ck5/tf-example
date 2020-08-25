terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  region = var.aws_region
}

resource "aws_eip" "default" {}
