output "vpc_id" {
  value = "${aws_vpc.main.id}"
}

output "public_subnets" {
  value = "${aws_subnet.public.*.id}"
}

output "public_cidrs" {
  value = "${aws_subnet.public.*.cidr_block}"
}

output "private_subnets" {
  value = "${aws_subnet.private.*.id}"
}

output "private_cidrs" {
  value = "${aws_subnet.private.*.cidr_block}"
}
