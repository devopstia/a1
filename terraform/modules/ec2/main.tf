resource "aws_instance" "example" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [var.vpc_security_group_ids[0]]
  subnet_id              = var.subnet_id
  root_block_device {
    volume_size = var.volume_size
  }
  tags = merge(var.tags, {
    Name = format("%s-%s-%s-bastion-host", var.tags["id"], var.tags["environment"], var.tags["project"])
    },
  )
}
