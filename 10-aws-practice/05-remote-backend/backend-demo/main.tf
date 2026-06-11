terraform {
    required_providers {
        local = {
            source = "hashicorp/local"
        }
    }
}

 resource "local_file" "demo" {
    filename = "backend-test.txt"
    content = "Terraform Remote Backend Demo"
 }
