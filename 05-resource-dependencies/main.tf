terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
    }
  }
}

resource "local_file" "first" {
  filename = "first.txt"
  content = "I am first"
}

resource "local_file" "second" {
  filename = "second.txt"
  content  = "First file ID: ${local_file.first.id}"
}