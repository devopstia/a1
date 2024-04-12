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