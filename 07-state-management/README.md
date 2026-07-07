# 07 – State Management

The state file is the most important and most fragile part of Terraform. This folder is a tiny resource used purely to poke at state.

## What state is

terraform.tfstate is a JSON file mapping my config to the real resources. It is how Terraform knows what already exists, what changed, and what belongs to it. Lose the state and Terraform forgets everything it built, while the resources keep running (and billing).

## Commands I practised

```bash
terraform state list                    # everything in state
terraform state show local_file.state_demo   # full details of one resource
terraform state rm <resource>          # forget a resource without destroying it
```

## Rules I follow now

- Never edit the state file by hand. The state commands exist for a reason
- Never commit state to git. It can contain secrets in plain text, and two people applying with different local states is how infrastructure gets corrupted
- My .gitignore covers *.tfstate for exactly this reason

## The team problem

Local state works alone. In a team, everyone needs the same state, which is what remote backends solve. That practical is in 10-aws-practice/05-remote-backend.

## What I noticed

- Deleting the created file manually and running plan made Terraform notice the drift and offer to recreate it. State is what makes that comparison possible
