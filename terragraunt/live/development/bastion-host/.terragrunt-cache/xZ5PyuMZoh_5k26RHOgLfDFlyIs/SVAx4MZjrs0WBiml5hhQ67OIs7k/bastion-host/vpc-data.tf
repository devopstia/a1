data "aws_vpc" "del_vpc" {
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

data "aws_subnet" "public-01" {
  filter {
    name   = "tag:Name"
    values = ["2560-dev-del-public-subnet-1-us-east-1a"]
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
