# 06 – Provisioners

Provisioners run commands as part of the resource lifecycle. Useful to know, dangerous to love.

## What the code does

Creates a file, and a local-exec provisioner appends a line to log.txt on my machine when the resource is created.

## Types

- local-exec: runs a command on the machine running Terraform
- remote-exec: runs commands inside the created resource (over SSH), for example installing packages on a new EC2

## Why provisioners are a last resort

The Terraform documentation itself says this, and I get why:

- Terraform cannot see what a provisioner did, so it cannot detect drift in it or roll it back
- If the provisioner fails, the resource is marked tainted and gets recreated next apply
- Server configuration belongs to user_data, cloud-init or tools like Ansible, not to Terraform provisioners

## What I noticed

- The provisioner only ran on create, not on every apply
- Deleting log.txt and running apply again did not bring it back. Terraform does not track files a provisioner made, which is exactly the visibility problem in action
