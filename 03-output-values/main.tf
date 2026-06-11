terraform {
    required_providers {
        local ={
            source = "hashicorp/local"
        }
    }
}

resource "local_file" "demo" {
    filename = "output-demo.txt"
    content = "Terraform outputs Demo"
}
