terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
    }
  }
}

resource "local_file" "state_demo" {
  filename = "state-demo.txt"
  content  = "Terraform State Demo"
}
