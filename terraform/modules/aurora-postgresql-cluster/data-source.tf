data "aws_vpc" "vpc_id" {
  filter {
    name   = "tag:Name"
    values = [format("%s-%s-%s-vpc", var.tags["id"], var.tags["environment"], var.tags["project"])]
  }
}

data "aws_subnet" "private_1" {
  filter {
    name   = "tag:Name"
    values = ["2650-dev-del-private-subnet-1-us-east-1a"]
  }
}

data "aws_subnet" "private_2" {
  filter {
    name   = "tag:Name"
    values = ["2650-dev-del-private-subnet-2-us-east-1b"]
  }
}

data "aws_secretsmanager_secret" "rds_password" {
  name = "2560-dev-del-artifactory-db-password"
}

data "aws_secretsmanager_secret_version" "rds_password" {
  secret_id = data.aws_secretsmanager_secret.rds_password.id
}

data "aws_secretsmanager_secret" "rds_username" {
  name = "2560-dev-del-artifactory-db-username"
}

data "aws_secretsmanager_secret_version" "rds_username" {
  secret_id = data.aws_secretsmanager_secret.rds_username.id
}


## CREATE A DATABASE WITH USERNAME AND PASSWORD
# password = data.aws_secretsmanager_secret_version.rds_password.secret_string
# username = data.aws_secretsmanager_secret_version.rds_username.secret_string
