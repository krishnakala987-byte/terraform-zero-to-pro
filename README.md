# Terraform Zero to Pro

This repository is my hands-on Terraform lab, worked through one concept at a time, from the very first config up to real AWS infrastructure with remote state.

It is the Infrastructure as Code continuation of my [aws-cloud-journey](https://github.com/krishnakala987-byte/aws-cloud-journey) repo. Over there I built AWS resources by hand in the console to understand them. Here I build the same kind of things as code.

## How this repo is structured

Each numbered folder is one focused step. I deliberately used the local provider (which just creates files on my machine) for folders 01 to 09, so I could learn every Terraform concept with zero cost and zero cleanup. Folder 10 points the same concepts at real AWS.

| Folder | Concept |
|--------|---------|
| 01-basics | first config, providers, the init/plan/apply/destroy workflow |
| 02-variables | inputs, variable files, precedence |
| 03-output-values | getting values back after apply |
| 04-local-values | locals vs variables |
| 05-resource-dependencies | implicit dependencies and depends_on |
| 06-provisioners | local-exec, and why provisioners are a last resort |
| 07-state-management | what the state file is, state commands, rules |
| 08-workspaces | one config, multiple environments |
| 09-modules | reusable modules with inputs |
| 10-aws-practice | provider auth, S3, data sources, IAM, remote backend in S3, VPC and subnets |

Every folder has its own README with what the code does, the commands I ran and what I noticed while running them.

## How to run any folder

```bash
cd <folder>
terraform init
terraform plan
terraform apply
terraform destroy   # when done
```

The AWS folders use the credentials from aws configure. No keys live in this repo, and state files are gitignored.

## Rules this repo taught me

- Always read the plan before typing yes
- State is sacred: never edit it by hand, never commit it
- Prefer resource references over depends_on
- Provisioners are a last resort, not a configuration tool
- Remote backend from day one when working with anyone else

## Learning reference

Concepts learned from the Terraform documentation and the AWS DevOps Zero to Hero series by Abhishek Veeramalla sir. All configs here were written, run, broken and fixed by me.

## Status

Actively growing as I take Terraform deeper: modules for real AWS infrastructure, state locking, and eventually a full environment built end to end.
