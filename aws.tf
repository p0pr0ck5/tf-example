resource "aws_eip" "foo" {}

variable "aws_region" {}

provider "aws" {
  region = var.aws_region
}
