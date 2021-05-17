terraform {
  required_version = ">= 0.13.5"

  required_providers {
    null = {
      version = "~> 2.0"
    }

    yaml = {
      version = "2.1"
      source = "providers.local/myorg/yaml"
    }
  }
}

resource "null_resource" "nill" {}
resource "null_resource" "nall" {}

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
