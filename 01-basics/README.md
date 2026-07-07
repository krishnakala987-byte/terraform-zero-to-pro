# 01 – Basics

My first ever Terraform config. The goal here was not AWS, it was just to see the Terraform workflow work end to end.

## What the code does

Creates one local file (demo.txt) using the local provider. No cloud, no cost, nothing to clean up in a console.

## Why start with the local provider

Every Terraform concept (providers, resources, state, plan, apply) works exactly the same whether the resource is a file on my laptop or an EC2 instance. The local provider let me learn the workflow without worrying about credentials or billing.

## Commands I ran

```bash
terraform init      # downloads the provider, creates .terraform folder
terraform plan      # shows what would be created
terraform apply     # actually creates it
terraform destroy   # removes it
```

## What I noticed

- init created a .terraform folder and a .terraform.lock.hcl file. The lock file pins the provider version so everyone gets the same one
- After apply, a terraform.tfstate file appeared. That file is how Terraform remembers what it created
- Running apply a second time changed nothing, because the real world already matched the config. That is the whole idea of declarative
