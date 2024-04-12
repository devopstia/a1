terraform {
  required_version = "~> 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = local.aws_region
}

terraform {
  backend "s3" {
    bucket         = "development-a1project-tf-state"
    dynamodb_table = "development-a1project-tf-state-lock"
    key            = "bastion-host"
    region         = "us-east-1"
  }
}

locals {
  aws_region    = "us-east-1"
  instance_type = "t2.micro"
  key_name      = "terraform-aws"
  volume_size   = "10"
  tags = {
    "id"             = "2560"
    "owner"          = "DevOps Easy Learning"
    "teams"          = "DEL"
    "environment"    = "development"
    "project"        = "bastion"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  }
}

module "ec2" {
  source        = "../../../modules/ec2"
  aws_region    = local.aws_region
  instance_type = local.instance_type
  key_name      = local.key_name
  volume_size   = local.volume_size
  tags          = local.tags
}