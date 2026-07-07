# 10 – AWS Practice

Everything before this folder used the local provider on purpose: learn the workflow without spending money. This folder is where the same concepts get pointed at real AWS.

Each subfolder is one step, in the order I did them.

## Before running any of these

The AWS provider needs credentials. I use the ones configured by aws configure (from my AWS CLI setup), so there are no keys inside any .tf file, and there never should be.

Also worth repeating: these create real resources. Everything here is Free Tier friendly, but I still run terraform destroy after each practice.

---

## 01-provider

The smallest possible AWS config: just the provider block with a region and a pinned version (~> 6.0). Ran init and plan to confirm authentication works before writing any resources. Boring on purpose, if this fails nothing else will work.

## 02-s3-bucket

First real AWS resource from Terraform: an S3 bucket. Two things from my AWS repo showed up immediately: bucket names are globally unique (hence the suffix in the name) and the bucket appeared in the console seconds after apply. Destroy removed it just as fast.

## 03-data-sources

Resources create things, data sources read things that already exist. Here aws_caller_identity reads who I am, and outputs print my account id and ARN. Data sources become important later for looking up AMI ids, existing VPCs, and anything Terraform did not create itself.

## 04-iam

IAM managed from code: a user, a group, the user added to the group, and a read only S3 policy attached to the group. The same structure I built by hand in my IAM classes, now reproducible with one apply. Seeing IAM as code also makes review possible: a pull request shows exactly who is getting what permission.

## 05-remote-backend

The most important step in this folder. Local state does not work in a team, so state moves to S3.

Two stage setup, because of a chicken and egg problem: the backend bucket cannot be managed by the backend that does not exist yet.

- bootstrap/: normal Terraform with local state, creates the state bucket
- backend-demo/: a config whose backend.tf points at that bucket. After terraform init, the state lives in S3, not on my laptop

Deleting the local state situation and seeing terraform still know its resources (because state was remote) is when backends clicked for me.

## 06-vpc

A VPC created through Terraform, with its state stored in the S3 backend from step 05 (key vpc/terraform.tfstate, so different projects keep separate state files in one bucket).

## 07-subnets

The VPC grows into a real network: public subnet, internet gateway, route table with a 0.0.0.0/0 route, and the route table association. This is the Terraform version of the network I built by hand in my AWS journey repo, and honestly it is satisfying to see the whole thing appear in one apply and disappear in one destroy.

---

## The habit these steps built

plan before apply, always read what plan says, destroy when done, and never let state or credentials near git.
