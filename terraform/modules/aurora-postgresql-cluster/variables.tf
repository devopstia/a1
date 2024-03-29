variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "tags" {
  type = map(any)
  default = {
    "id"             = "2560"
    "owner"          = "DevOps Easy Learning"
    "teams"          = "DEL"
    "environment"    = "dev"
    "project"        = "del"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  }
}

variable "availability_zones" {
  type = list(any)
}

variable "cluster_family" {
  type    = string
  default = "aurora-postgresql11"
}

variable "engine" {
  type    = string
  default = "aurora-postgresql"
}

variable "engine_version" {
  type    = string
  default = "11.9"
}

variable "database_name" {
  type    = string
  default = "artifactory"
}

variable "storage_encrypted" {
  type    = bool
  default = true
}

variable "backup_retention_period" {
  type    = string
  default = "7"
}

variable "preferred_backup_window" {
  type    = string
  default = "07:00-09:00"
}

variable "deletion_protection" {
  type    = bool
  default = false
}

variable "db_count" {
  type    = string
  default = "2"
}

variable "instance_class" {
  type    = string
  default = "db.r5.large"
}

variable "publicly_accessible" {
  type    = bool
  default = false
}