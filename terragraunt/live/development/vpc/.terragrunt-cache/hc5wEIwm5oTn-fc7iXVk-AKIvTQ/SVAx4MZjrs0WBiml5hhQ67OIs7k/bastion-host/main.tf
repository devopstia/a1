resource "aws_instance" "vm" {
  ami                     = var.ec2_instance_ami
  instance_type           = var.ec2_instance_type
  key_name                = var.ec2_instance_key_name
  vpc_security_group_ids  = [aws_security_group.sg.id]
  subnet_id               = data.aws_subnet.public-01.id
  disable_api_termination = var.enable_termination_protection

  root_block_device {
    volume_size = var.root_volume_size
  }

  tags = merge(var.tags, {
    Name = format("%s-%s-%s-${var.instance_name}", var.tags["id"], var.tags["environment"], var.tags["project"])
    },
  )
}
