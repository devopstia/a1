#!/bin/bash

echo "*****************************************************************"
echo "Deploying s3 backend module"
echo "*****************************************************************"
sleep 3
cd terraform/resources/s3-backend-with-replication
terraform init
terraform fmt
terraform apply --auto-approve
cd -


echo "*****************************************************************"
echo "Deploying the VPC module"
echo "*****************************************************************"
sleep 3
cd terraform/resources/vpc
terraform init
terraform fmt
terraform apply --auto-approve
cd -


echo "*****************************************************************"
echo "Deploying the bastion host module"
echo "*****************************************************************"
sleep 3
cd terraform/resources/bastion-host
terraform init
terraform fmt
terraform apply --auto-approve
cd -