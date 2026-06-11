terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
    }
  }
}

resource "local_file" "demo" {
  filename = "provisioner-demo.txt"
  content  = "Provisioner Example"

  provisioner "local-exec" {
    command = "echo Terraform created this file >> log.txt"
  }
}