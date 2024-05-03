#!/bin/bash

# echo "*****************************************************************"
# echo "Deploying s3 backend module"
# echo "*****************************************************************"
# sleep 3
# cd terraform/resources/s3-backend-with-replication
# terraform init
# terraform fmt
# terraform apply --auto-approve
# cd -


# echo "*****************************************************************"
# echo "Deploying the VPC module"
# echo "*****************************************************************"
# sleep 3
# cd terraform/resources/vpc
# terraform init
# terraform fmt
# terraform apply --auto-approve
# cd -


# echo "*****************************************************************"
# echo "Deploying the bastion host module"
# echo "*****************************************************************"
# sleep 3
# cd terraform/resources/bastion-host
# terraform init
# terraform fmt
# terraform apply --auto-approve
# cd -


echo "*****************************************************************"
echo "Deploying the eks-control-plane module"
echo "*****************************************************************"
cd terraform/resources/eks-control-plane
terraform init 
terraform fmt
terraform apply --auto-approve
cd -


echo "*****************************************************************"
echo "Deploying the aws-auth-config module"
echo "*****************************************************************"
cd terraform/resources/aws-auth-config
terraform init 
terraform fmt
terraform apply --auto-approve
cd -


echo "*****************************************************************"
echo "Deploying the eks-node-group module"
echo "*****************************************************************"
cd terraform/resources/eks-node-group
terraform init 
terraform fmt
terraform apply --auto-approve
cd -
