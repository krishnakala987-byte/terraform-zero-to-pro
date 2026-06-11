terraform {
    required_providers {
        local = {
            source = "hashicorp/local"
            
        }
    }
}

resource "local_file" "user_file" {
    filename = "user.txt"
    content = "Hello ${var.username}"
} 