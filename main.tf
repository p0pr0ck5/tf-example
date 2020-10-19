terraform {
  required_version = ">= 0.12.26"

  required_providers {
    random = "~> 2.3"
  }
}

resource "random_pet" "pet" {}
resource "random_pet" "other_pet" {}

data "http" "example" {
  url = "http://169.254.169.254/latest/meta-data/local-ipv4"
}
output "http" {
  value = data.http.example.body
}

output "pet" {
  value = random_pet.pet.id
}

output "other_pet" {
  value = random_pet.other_pet.id
}
