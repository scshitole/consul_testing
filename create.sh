#!/bin/bash

cd s3
terraform init
terraform plan -var-file="../terraform/terraform.tfvars"
terraform apply -var-file="../terraform/terraform.tfvars" --auto-approve

cd ../terraform
terraform init
terraform plan
terraform apply --auto-approve
