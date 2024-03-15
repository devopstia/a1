
resource "aws_security_group" "rds_sg" {
  vpc_id = data.aws_vpc.vpc_id.id

  ingress {
    from_port   = 5432
    to_port     = 5432
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

resource "aws_db_subnet_group" "subnet_group" {
  name = format("%s-%s-%s-db-subnet-group", var.tags["id"], var.tags["environment"], var.tags["project"])
  subnet_ids = [
    data.aws_subnet.private_1.id,
    data.aws_subnet.private_2.id
  ]
}

resource "aws_rds_cluster_parameter_group" "cluster_parameter_group" {
  name        = format("%s-%s-%s-cluster-parameter-group", var.tags["id"], var.tags["environment"], var.tags["project"])
  family      = var.cluster_family
  description = format("%s-%s-%s-cluster-parameter-group", var.tags["id"], var.tags["environment"], var.tags["project"])
}

resource "aws_rds_cluster" "aurora-cluster" {
  cluster_identifier              = format("%s-%s-%s-${var.database_name}-cluster", var.tags["id"], var.tags["environment"], var.tags["project"])
  engine                          = var.engine
  engine_version                  = var.engine_version
  database_name                   = var.database_name
  master_username                 = data.aws_secretsmanager_secret_version.rds_username.secret_string
  master_password                 = data.aws_secretsmanager_secret_version.rds_password.secret_string
  db_subnet_group_name            = aws_db_subnet_group.subnet_group.name
  vpc_security_group_ids          = [aws_security_group.rds_sg.id]
  db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.cluster_parameter_group.name
  skip_final_snapshot             = true # Set to false if you want to take a final snapshot when deleting the cluster

  storage_encrypted       = var.storage_encrypted
  backup_retention_period = var.backup_retention_period
  preferred_backup_window = var.preferred_backup_window
  deletion_protection     = var.deletion_protection
  lifecycle {
    ignore_changes = [
      engine_version
    ]
  }
  tags = {
    Name = format("%s-%s-%s-${var.database_name}-cluster", var.tags["id"], var.tags["environment"], var.tags["project"])
  }
}

resource "aws_rds_cluster_instance" "cluster_instances" {
  count                = var.count
  cluster_identifier   = aws_rds_cluster.aurora-cluster.id
  instance_class       = var.instance_class
  engine               = var.engine
  engine_version       = var.engine_version
  publicly_accessible  = var.publicly_accessible
  db_subnet_group_name = aws_db_subnet_group.subnet_group.name
  identifier           = "${var.database_name}-${count.index + 1}"
  lifecycle {
    ignore_changes = [
      engine_version
    ]
  }
  tags = {
    Name = "${var.database_name}-${count.index + 1}"
  }
}

# resource "aws_route53_record" "cluster-alias" {
#   count = length(aws_rds_cluster_instance.cluster_instances)

#   zone_id = "Z09063052B43KCQ7FSGHY"
#   name    = "${var.database_name}-${count.index}"
#   type    = "CNAME"
#   ttl     = "30"

#   records = [aws_rds_cluster_instance.cluster_instances[count.index].endpoint]
# }

resource "aws_route53_record" "cluster-alias" {
  zone_id = "Z09063052B43KCQ7FSGHY"
  name    = var.database_name
  type    = "CNAME"
  ttl     = "30"
  records = [aws_rds_cluster.aurora-cluster.endpoint]
}