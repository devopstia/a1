resource "aws_s3_bucket" "state" {
  provider      = aws.state
  force_destroy = var.force_destroy
  bucket        = format("%s-%s-%s-tf-state", var.common_tags["id"], var.common_tags["environment"], var.common_tags["project"])

  tags = var.common_tags
}

resource "aws_s3_bucket_replication_configuration" "state" {
  depends_on = [
    aws_s3_bucket.state,
    aws_s3_bucket.backup
  ]
  bucket = aws_s3_bucket.state.id
  role   = aws_iam_role.replication.arn

  rule {
    id     = "StateReplicationAll"
    status = "Enabled"

    destination {
      bucket        = aws_s3_bucket.backup.arn
      storage_class = "STANDARD"
    }
  }
}

resource "aws_s3_bucket" "backup" {
  provider      = aws.backup
  force_destroy = var.force_destroy
  bucket        = format("%s-%s-%s-tf-state-backup", var.common_tags["id"], var.common_tags["environment"], var.common_tags["project"])

  tags = var.common_tags
}

resource "aws_s3_bucket_versioning" "main" {
  depends_on = [aws_s3_bucket.state]
  provider   = aws.state
  bucket     = aws_s3_bucket.state.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_versioning" "backup" {
  provider   = aws.backup
  depends_on = [aws_s3_bucket.backup]
  bucket     = aws_s3_bucket.backup.id
  versioning_configuration {
    status = "Enabled"
  }
}


