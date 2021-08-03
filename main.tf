terraform {
  required_version = ">= 0.13.5"

  required_providers {
    random = {
      source = "hashicorp/random"
      version = "~> 2.3"
    }
    stress = {
      source = "local/foo/stress"
      version = ">= 0.0.1"
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
