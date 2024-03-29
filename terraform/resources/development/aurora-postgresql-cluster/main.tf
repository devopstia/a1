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
    key            = "aurora-postgresql"
    region         = "us-east-1"
  }
}

locals {
  aws_region = "us-east-1"

  availability_zones = [
    "us-east-1a",
    "us-east-1b",
    "us-east-1c"
  ]

  cluster_family          = "aurora-postgresql11"
  engine                  = "aurora-postgresql"
  engine_version          = "11.9"
  database_name           = "artifactory"
  storage_encrypted       = true
  backup_retention_period = "7"
  preferred_backup_window = "07:00-09:00"
  deletion_protection     = false
  db_count                = "2"
  instance_class          = "db.r5.large"
  publicly_accessible     = false

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

module "aurora-postgresql-cluster" {
  source                  = "../../../modules/aurora-postgresql-cluster"
  aws_region              = local.aws_region
  availability_zones      = local.availability_zones
  cluster_family          = local.cluster_family
  engine                  = local.engine
  engine_version          = local.engine_version
  database_name           = local.database_name
  storage_encrypted       = local.storage_encrypted
  backup_retention_period = local.backup_retention_period
  preferred_backup_window = local.preferred_backup_window
  deletion_protection     = local.deletion_protection
  db_count                = local.db_count
  instance_class          = local.instance_class
  publicly_accessible     = local.publicly_accessible
  tags                    = local.tags
}
