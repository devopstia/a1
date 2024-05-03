data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = ["2560-dev-del-vpc"]
  }
  filter {
    name   = "tag:environment"
    values = ["dev"]
  }
  filter {
    name   = "tag:project"
    values = ["del"]
  }
}

data "aws_subnet" "private-01" {
  filter {
    name   = "tag:Name"
    values = ["2560-dev-del-private-subnet-1-us-east-1a"]
  }
  filter {
    name   = "tag:environment"
    values = ["dev"]
  }
  filter {
    name   = "tag:project"
    values = ["del"]
  }
}

data "aws_subnet" "private-02" {
  filter {
    name   = "tag:Name"
    values = ["2560-dev-del-private-subnet-2-us-east-1b"]
  }
  filter {
    name   = "tag:environment"
    values = ["dev"]
  }
  filter {
    name   = "tag:project"
    values = ["del"]
  }
}

data "aws_subnet" "private-03" {
  filter {
    name   = "tag:Name"
    values = ["2560-dev-del-private-subnet-3-us-east-1c"]
  }
  filter {
    name   = "tag:environment"
    values = ["dev"]
  }
  filter {
    name   = "tag:project"
    values = ["del"]
  }
}
