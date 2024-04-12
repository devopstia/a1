## Terraform block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  alias  = "state"
  region = local.aws_region_main
}

provider "aws" {
  alias  = "backup"
  region = local.aws_region_backup
}


locals {
  aws_region_main   = "us-east-1"
  aws_region_backup = "us-east-2"
  force_destroy     = true
  common_tags = {
    "id"             = "2560"
    "owner"          = "DevOps Easy Learning"
    "environment"    = "dev"
    "project"        = "del"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  }
}

module "s3-backend-with-replication" {
  source            = "../../modules/s3-backend-with-replication"
  aws_region_main   = local.aws_region_main
  aws_region_backup = local.aws_region_backup
  force_destroy     = local.force_destroy
  common_tags       = local.common_tags
}
