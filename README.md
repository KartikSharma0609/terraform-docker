# Task 3: Infrastructure as Code with Terraform

## What I did
- Used the Terraform **Docker provider** (`kreuzwerker/docker`) to provision a local Docker container.
- `main.tf` pulls the `nginx` image and runs a container `tf-nginx`, exposing it on port **8081**.
- Ran the workflow: `init` -> `plan` -> `apply` -> `state list/show` -> `destroy`.
- Logs are in `logs/`, screenshots in `screenshots/`.

## How to run
```bash
terraform init
terraform plan
terraform apply
terraform state list
curl -I http://localhost:8081
terraform destroy
```
Or run `./run.sh` to execute everything and save logs automatically.

## Interview Questions
1. **What is IaC?** Managing and provisioning infrastructure through code files instead of manual steps, so it is versioned, repeatable and automated.
2. **How does Terraform work?** You describe the desired state in `.tf` files. Terraform compares it with the state file and real infrastructure, builds a plan, and uses providers to create, update or delete resources through APIs.
3. **What is the state file?** `terraform.tfstate` records the resources Terraform manages and their current attributes. It maps your code to real resources and is used to detect changes.
4. **Apply vs plan?** `plan` only previews what will change. `apply` actually makes the changes.
5. **What are providers?** Plugins that let Terraform talk to a platform's API (Docker, AWS, Azure, etc.).
6. **What is resource dependency?** When one resource needs another first. Implicit: referencing `docker_image.nginx.image_id` in the container. Explicit: `depends_on`. Terraform uses this to order creation.
7. **How do you handle secrets?** Mark variables `sensitive = true`, pass them via environment variables (`TF_VAR_*`) or `.tfvars` files excluded from Git, and use a secrets manager (Vault, AWS Secrets Manager). Never hardcode them, and protect the state file because it can contain secrets.
8. **Benefits of Terraform?** Cloud-agnostic, declarative, reusable, version-controlled, previewable with plan, consistent environments, and easy to destroy and recreate.

## Screenshots
Add images from `screenshots/` here.
