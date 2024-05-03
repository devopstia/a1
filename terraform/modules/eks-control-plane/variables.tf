variable "tags" {
  type        = map(string)
  description = "Common tags to be applied to resources"
}

variable "aws_region" {
  type = string
}

variable "eks_version" {
  type = string
}

variable "endpoint_private_access" {
  type = bool
}

variable "endpoint_public_access" {
  type = bool
}
