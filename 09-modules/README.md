# 09 – Modules

Modules are how Terraform code stops being copy paste. Write a piece of infrastructure once, call it many times with different inputs.

## What the code does

- modules/file-module: a tiny reusable module that creates one file. Its variables.tf defines the inputs (filename, content)
- Root main.tf calls that module twice with different values, producing app1.txt and app2.txt

Same code, two resources, zero duplication.

## The structure

```
09-modules/
├── main.tf                  # the root module, calls the child module
└── modules/
    └── file-module/
        ├── main.tf          # the resource
        └── variables.tf     # the module's inputs
```

## What I noticed

- Variables are the module's input interface, outputs would be its return values
- After adding a module I had to run terraform init again so Terraform picks it up
- Resource names inside state become module.my_file.local_file.module_file, so state list shows exactly which module instance owns what

## Why this matters

Real infrastructure is module calls almost all the way down: a vpc module, an ec2 module, an rds module, each called per environment with different inputs. This toy version is the same pattern with local files, and the AWS practice in folder 10 builds toward exactly that.
