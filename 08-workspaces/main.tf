terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
    }
  }
}

resource "local_file" "env_file" {
  filename = "${terraform.workspace}.txt"
  content  = "Environment: ${terraform.workspace}"
}
