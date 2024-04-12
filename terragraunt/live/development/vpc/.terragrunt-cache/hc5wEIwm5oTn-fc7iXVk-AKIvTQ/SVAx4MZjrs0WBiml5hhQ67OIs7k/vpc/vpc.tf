resource "aws_vpc" "main" {
  cidr_block           = var.cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  # enable_classiclink   = false
  tags = merge(var.tags, {
    Name = format("%s-%s-%s-vpc", var.tags["id"], var.tags["environment"], var.tags["project"])
    },
  )
}

