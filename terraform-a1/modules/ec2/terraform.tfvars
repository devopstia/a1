aws_region             = "us-east-1"
ami                    = "ami-0c7217cdde317cfec"
instance_type          = "t2.micro"
key_name               = "terraform-aws"
vpc_security_group_ids = ["sg-0c51540c60857b7ed"]
subnet_id              = "subnet-096d45c28d9fb4c14"
volume_size            = "10"
tags = {
  "id"             = "2560"
  "owner"          = "DevOps Easy Learning"
  "teams"          = "DEL"
  "environment"    = "development"
  "project"        = "a1"
  "create_by"      = "Terraform"
  "cloud_provider" = "aws"
}
