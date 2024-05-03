variable "aws_region" {
  type = string
}

variable "tags" {
  type        = map(string)
  description = "Common tags to be applied to resources"
}

variable "eks_version" {
  type = string
}

variable "node_min" {
  type = string
}

variable "desired_node" {
  type = string
}

variable "node_max" {
  type = string
}

variable "blue_node_color" {
  type = string
}

variable "green_node_color" {
  type = string
}

variable "blue" {
  type = bool
}

variable "green" {
  type = bool
}

variable "ec2_ssh_key" {
  type        = string
  description = "SSH key to connect to the node from bastion host"
}

variable "deployment_nodegroup" {
  type = string
}

variable "capacity_type" {
  type        = string
  description = "Valid values: ON_DEMAND, SPOT"
}

variable "ami_type" {
  type        = string
  description = "Valid values: AL2_x86_64, AL2_x86_64_GPU, AL2_ARM_64"
}

variable "instance_types" {
  type        = string
  description = "t3.medium should be used at least"
}

variable "disk_size" {
  type = string
}


variable "shared_owned" {
  type        = string
  description = "Valid values are shared or owned"
}

variable "enable_cluster_autoscaler" {
  type        = string
  description = "Valid values are true or false"
}

variable "control_plane_name" {
  type = string
}