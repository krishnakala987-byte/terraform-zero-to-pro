# 02 – Variables

Hardcoding values gets old fast. This step moves the username out of the resource and into a variable.

## What the code does

Creates user.txt with "Hello <username>", where username comes from a variable defined in variables.tf.

## Ways to pass a value

I tried all of these:

```bash
terraform apply                          # prompts me because there is no default
terraform apply -var="username=Krishna"  # inline
```

A default in the variable block or a terraform.tfvars file also works. Order of precedence: -var flag beats tfvars, tfvars beats default.

## What I noticed

- type and description in the variable block are optional but worth writing. The description shows up in the prompt
- Splitting variables into variables.tf is convention, not a requirement. Terraform reads all .tf files in the folder as one config
- tfvars files are in my .gitignore, because that is where real values (and sometimes secrets) end up
