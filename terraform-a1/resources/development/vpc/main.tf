provider "aws" {
  region = local.region
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
    key            = "vpc"
    region         = "us-east-1"
  }
}

locals {
  region       = "us-east-1"
  cluster_name = "2560-development-a1project"
  # cidr_block   = "10.0.0.0/16"
  cidr_block = "10.10.0.0/16"
  nat_number = "1"
  availability_zones = [
    "us-east-1a",
    "us-east-1b",
    "us-east-1c"
  ]

  tags = {
    "id"             = "2560"
    "owner"          = "DevOps Easy Learning"
    "teams"          = "DEL"
    "environment"    = "production"
    "project"        = "a1project"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  }
}

module "vpc" {
  source             = "../../../modules/vpc"
  cidr_block         = local.cidr_block
  region             = local.region
  availability_zones = local.availability_zones
  cluster_name       = local.cluster_name
  nat_number         = local.nat_number
  tags               = local.tags
}
