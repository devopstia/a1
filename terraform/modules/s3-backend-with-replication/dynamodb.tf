resource "aws_dynamodb_table" "tf-state-lock" {
  provider       = aws.state
  name           = format("%s-%s-%s-tf-state-lock", var.common_tags["id"], var.common_tags["environment"], var.common_tags["project"])
  hash_key       = "LockID"
  read_capacity  = 20
  write_capacity = 20
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = var.common_tags
}
