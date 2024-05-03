provider "aws" {
  aws_region = local.aws_region
}

terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

terraform {
  backend "s3" {
    bucket         = "2560-dev-del-tf-state"
    dynamodb_table = "2560-dev-del-tf-state-lock"
    key            = "eks-control-plane/terraform.tf"
    region         = "us-east-1"
  }
}

locals {
  aws_region              = "us-east-1"
  eks_version             = "1.28"
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

module "eks-control-plane" {
  source                  = "../../modules/eks-control-plane"
  aws_region              = local.aws_region
  eks_version             = local.eks_version
  endpoint_private_access = local.endpoint_private_access
  endpoint_public_access  = local.endpoint_public_access
  tags                    = local.tags
}
