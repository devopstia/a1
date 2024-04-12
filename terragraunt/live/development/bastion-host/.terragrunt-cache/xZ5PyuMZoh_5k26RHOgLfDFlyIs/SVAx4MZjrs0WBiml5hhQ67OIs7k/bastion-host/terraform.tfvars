aws_region                    = "us-east-1"
ec2_instance_ami              = "ami-0fc5d935ebf8bc3bc"
ec2_instance_type             = "t2.micro"
sg_name                       = "test"
instance_name                 = "test"
root_volume_size              = 10
enable_termination_protection = false
ec2_instance_key_name         = "terraform-aws"
allowed_ports = [
  22,
]
tags = {
  "id"             = "2560"
  "owner"          = "DevOps Easy Learning"
  "environment"    = "dev"
  "project"        = "del"
  "create_by"      = "Terraform"
  "cloud_provider" = "aws"
}
