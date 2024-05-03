terraform {
  source = "../../../../terraform/modules//eks-control-plane"
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
  aws_region              = "us-east-1"
  eks_version             = 1.28
  endpoint_private_access = false
  endpoint_public_access  = true
  tags = {
    "id"             = "2560"
    "owner"          = "DevOps Easy Learning"
    "environment"    = "dev"
    "project"        = "del"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  }
}
