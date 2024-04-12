variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "ami" {
  type    = string
  default = "ami-0c7217cdde317cfec"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "key_name" {
  type    = string
  default = "terraform-aws"
}

variable "vpc_security_group_ids" {
  type    = list(string)
  default = ["sg-0c51540c60857b7ed"]
}

variable "subnet_id" {
  type    = string
  default = "subnet-096d45c28d9fb4c14"
}

variable "volume_size" {
  type    = string
  default = "10"
}

variable "tags" {
  type = map(any)
  default = {
    "id"             = "2560"
    "owner"          = "DevOps Easy Learning"
    "teams"          = "DEL"
    "environment"    = "development"
    "project"        = "a1"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  }
}
