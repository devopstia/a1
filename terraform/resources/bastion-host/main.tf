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
    bucket         = "2560-dev-del-tf-state"
    dynamodb_table = "2560-dev-del-tf-state-lock"
    key            = "bastion-host/terraform.tf"
    region         = "us-east-1"
  }
}

locals {
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

module "bastion-host" {
  source                        = "../../modules/bastion-host"
  aws_region                    = local.aws_region
  ec2_instance_ami              = local.ec2_instance_ami
  ec2_instance_type             = local.ec2_instance_type
  sg_name                       = local.sg_name
  instance_name                 = local.instance_name
  ec2_instance_key_name         = local.ec2_instance_key_name
  root_volume_size              = local.root_volume_size
  allowed_ports                 = local.allowed_ports
  enable_termination_protection = local.enable_termination_protection
  tags                          = local.tags
}
