provider "aws" {
  region = local.aws_region
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
    bucket         = "development-a1project-tf-state"
    dynamodb_table = "development-a1project-tf-state-lock"
    key            = "aws-secret-manager"
    region         = "us-east-1"
  }
}

locals {
  aws_region = "us-east-1"
  aws-secret-string = [
    "artifactory-db-username",
    "artifactory-db-password"
  ]

  tags = {
    "id"             = "2560"
    "owner"          = "DevOps Easy Learning"
    "teams"          = "DEL"
    "environment"    = "dev"
    "project"        = "del"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  }
}

module "aws-secret-manager" {
  source            = "../../../modules/aws-secret-manager"
  aws_region        = local.aws_region
  aws-secret-string = local.aws-secret-string
  tags              = local.tags
}
