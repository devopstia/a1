terraform {
  source = "../../../../terraform/modules//bastion-host"
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "${get_terragrunt_dir()}/../vpc", 
    ]
}

inputs = {
  aws_region                    = "us-east-1"
  ec2_instance_ami              = "ami-0e60bd4d8dee794b6"
  ec2_instance_type             = "t2.micro"
  sg_name                       = "bastion-sg"
  instance_name                 = "bastion"
  root_volume_size              = 30
  enable_termination_protection = false
  ec2_instance_key_name         = "terraform-aws"
  allowed_ports = [
    22
  ]
  tags = {
    "id"             = "2560"
    "owner"          = "DevOps Easy Learning"
    "environment"    = "dev"
    "project"        = "del"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  }
}