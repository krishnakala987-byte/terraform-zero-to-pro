terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
    }
  }
}

module "my_file" {
  source = "./modules/file-module"

  filename = "app1.txt"
  content  = "Created from Module Input"
}

module "my_file2" {
  source = "./modules/file-module"

  filename = "app2.txt"
  content  = "Created from Module Input 2"
}
