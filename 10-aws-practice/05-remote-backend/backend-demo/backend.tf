terraform {
    backend "s3" {
        bucket = "krishna-terraform-state-2915"
        key = "dev/terraform.tfstate"
        region = "us-east-1"
    }
}

