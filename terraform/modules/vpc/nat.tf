resource "aws_nat_gateway" "main" {
  count         = var.tags["environment"] == "production" ? length(var.availability_zones) : var.nat_number
  subnet_id     = element(aws_subnet.public.*.id, count.index)
  allocation_id = element(aws_eip.nat.*.id, count.index)
  tags = merge(var.tags, {
    Name = format("%s-%s-%s-nat-${count.index + 1}-${element(var.availability_zones, count.index)}", var.tags["id"], var.tags["environment"], var.tags["project"])
    },
  )
}
