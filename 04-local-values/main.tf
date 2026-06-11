terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
    }
  }
}

locals {
  username = "Krishna"
  project  = "terraform-learning"
}

resource "local_file" "demo" {
  filename = "local-demo.txt"

  content = <<EOF
User: ${local.username}
Project: ${local.project}
EOF
}