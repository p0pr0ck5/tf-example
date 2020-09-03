terraform {
  required_version = ">= 0.12.26"

  required_providers {
    random = "~> 2.3"
  }
}

resource "random_pet" "pet" {}

output "pet" {
  value = random_pet.pet.id
}
