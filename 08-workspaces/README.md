# 08 – Workspaces

One config, several parallel states. That is all a workspace is.

## What the code does

The filename uses ${terraform.workspace}, so each workspace creates its own file: default.txt in the default workspace, dev.txt in a dev workspace.

## Commands

```bash
terraform workspace list      # shows workspaces, * marks current
terraform workspace new dev   # create and switch
terraform workspace select default
```

## What I noticed

- Every fresh config starts in a workspace called default
- Each workspace has its own state, so applying in dev did not touch what default created
- The states land under terraform.tfstate.d/<workspace-name>/

## When I would use them (and not)

Workspaces fit small setups where environments differ only by a few values. For serious environments most teams keep separate folders or separate state keys per environment instead, because workspaces make it too easy to apply to prod while thinking you are in dev. Knowing terraform.workspace is also an interview question, so worth having actually run it.
