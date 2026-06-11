terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

data "aws_caller_identity" "current" {}

output "accound_id" {
  value = data.aws_caller_identity.current.account_id
}

output "usr_arn" {
  value = data.aws_caller_identity.current.arn
}
