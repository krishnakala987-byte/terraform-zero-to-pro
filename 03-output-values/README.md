# 03 – Output Values

After apply, I usually need something back: an ID, a name, later an IP or a URL. Outputs are how Terraform hands values out.

## What the code does

Creates a file and outputs its filename and its id after apply.

## Commands

```bash
terraform apply
terraform output            # prints all outputs
terraform output file_name  # prints just one
```

## What I noticed

- Outputs print at the end of every apply, so the useful values are always in front of me
- Real use case later: output the public IP of an EC2 or the DNS name of a load balancer, instead of digging through the console
- Outputs are also how modules return values to whoever called them, which becomes important in folder 09
