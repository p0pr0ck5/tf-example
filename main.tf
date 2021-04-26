terraform {
  required_version = ">= 0.12"

  required_providers {
    yaml = ">= 2.0"
    null = "~> 2.0"
  }
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

resource "null_resource" "null" {}

output "json" {
  value = data.yaml_to_json.doc.output
}

output "result" {
  value = jsondecode(data.yaml_to_json.doc.output)
}
