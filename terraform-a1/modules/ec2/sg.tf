resource "aws_security_group" "rds_sg" {
  vpc_id = data.aws_vpc.vpc_id.id
  name   = format("%s-%s-%s-bastion-host-sg", var.tags["id"], var.tags["environment"], var.tags["project"])
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
