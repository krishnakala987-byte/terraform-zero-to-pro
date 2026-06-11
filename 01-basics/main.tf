terraform {
    required_providers {
        local = {
            source  = "hashicorp/local"
        }
    }
}

resource "local_file" "demo" {
    filename = "demo.txt"
    content  = "Terraform created this file !"
}