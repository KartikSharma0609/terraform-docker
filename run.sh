#!/bin/bash
# Runs the full Terraform workflow and saves execution logs into logs/
set -e
mkdir -p logs
terraform init          2>&1 | tee logs/01-init.log
terraform plan          2>&1 | tee logs/02-plan.log
terraform apply -auto-approve 2>&1 | tee logs/03-apply.log
terraform state list    2>&1 | tee logs/04-state-list.log
terraform state show docker_container.web 2>&1 | tee -a logs/04-state-list.log
docker ps --filter name=tf-nginx 2>&1 | tee logs/05-docker-ps.log
curl -sI http://localhost:8081 2>&1 | tee logs/06-curl.log
echo "Run 'terraform destroy -auto-approve 2>&1 | tee logs/07-destroy.log' when ready to destroy."
