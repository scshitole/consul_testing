#!/bin/bash

cd terraform
terraform destroy --auto-approve

cd ../s3
terraform destroy --auto-approve

