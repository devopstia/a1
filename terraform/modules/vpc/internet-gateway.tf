resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = merge(var.tags, {
    Name = format("%s-%s-%s-internet-gateway", var.tags["id"], var.tags["environment"], var.tags["project"])
    },
  )
}
