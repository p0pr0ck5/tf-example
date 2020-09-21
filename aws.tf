resource "aws_eip" "foo" {}

provider "aws" {
  region = var.aws_region
}
