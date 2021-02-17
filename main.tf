terraform {
  required_version = ">= 0.13.5"

  required_providers {
    random = {
      source = "hashicorp/random"
      version = "~> 2.3"
    }
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

data "http" "example" {
  url = "http://169.254.169.254/latest/meta-data/local-ipv4"
}

output "http" {
  value = data.http.example.body
}

