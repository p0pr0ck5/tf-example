terraform {
  required_version = ">= 0.13.5"

  required_providers {
    random = {
      source = "hashicorp/random"
      version = "~> 2.3"
    }

    yaml = {
      version = "2.1"
      source = "providers.local/myorg/yaml"
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

data "yaml_to_json" "doc" {
  input = <<EOF
foo: 123
456: bar
columns:
  - name: column0
    type: boolean
  - name: column1
    type: integer
EOF

}

output "json" {
  value = data.yaml_to_json.doc.output
}

output "result" {
  value = jsondecode(data.yaml_to_json.doc.output)
}
