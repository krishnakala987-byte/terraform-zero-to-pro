# 04 – Local Values

Locals are named values computed inside the config. I think of them as constants and helpers, while variables are the inputs a user provides.

## What the code does

Defines username and project as locals and writes both into a file using ${local.name} references.

## Locals vs variables

- variable: comes from outside (user, tfvars, CI pipeline). Use when the value should be changeable per run
- local: defined inside the config. Use for values repeated in several places, or values built out of other values

A good sign I need a local: the same string appearing in three resources. Change it once in locals, it changes everywhere.

## What I noticed

- The heredoc syntax (<<EOF ... EOF) is handy for multi line file content
- Locals can reference variables and other locals, so they are good for building naming patterns like "${var.project}-${var.env}-bucket"
