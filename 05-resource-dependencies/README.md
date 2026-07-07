# 05 – Resource Dependencies

Terraform builds a dependency graph and creates resources in the right order. This step proves it with two files.

## What the code does

- first.txt: a plain file
- second.txt: its content references the id of the first file

Because second uses local_file.first.id, Terraform knows first must exist before second. That is an implicit dependency, created just by referencing another resource's attribute.

## Implicit vs explicit

- Implicit: the reference itself creates the ordering. This covers almost every case
- Explicit: depends_on = [resource] for when there is a real dependency but no attribute reference, for example an app that needs a policy attached first

## What I noticed

- The plan output shows the creation order matching the graph
- On destroy, Terraform reverses the order automatically: second goes before first
- Rule I follow now: prefer references over depends_on. If I need depends_on often, the design probably has a problem
