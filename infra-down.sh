#!/bin/bash

echo "*****************************************************************"
echo "Deleting the bastion host"
echo "*****************************************************************"
sleep 3
cd terraform/resources/bastion-host
terraform init
terraform destroy --auto-approve
cd -


echo "*****************************************************************"
echo "Deleting the VPC module"
echo "*****************************************************************"
sleep 3
cd terraform/resources/vpc
terraform init
terraform destroy --auto-approve
cd -


echo "*****************************************************************"
echo "Deleting s3 backend module"
echo "*****************************************************************"
sleep 3
cd terraform/resources/s3-backend-with-replication
terraform init
terraform destroy --auto-approve
cd -



