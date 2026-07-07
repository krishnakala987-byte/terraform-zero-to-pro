terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 6.0"
        }
    }
}

provider "aws" {
    region = "us-east-1"
}


resource "aws_iam_user" "demo_user" {
    name = "terraform-demo-user"
}

resource "aws_iam_group" "demo_group" {
    name = "terraform-demo-group"
}

resource "aws_iam_user_group_membership" "demo_membership" {
    user   = aws_iam_user.demo_user.name
    groups = [aws_iam_group.demo_group.name]
}

resource "aws_iam_group_policy_attachment" "s3_read_only" {
    group      = aws_iam_group.demo_group.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}
