variable "count" {
  default     = "1"
  description = "Module count, defaults to \"1\"."
}

variable "name" {
  default     = "vault-server-ports-aws"
  description = "Name for resources, defaults to \"vault-server-ports-aws\"."
}

variable "vpc_id" {
  description = "VPC ID to provision resources in."
}

variable "cidr_blocks" {
  type        = "list"
  description = "CIDR blocks for Security Groups."
}

variable "tags" {
  type        = "map"
  default     = {}
  description = "Optional map of tags to set on resources, defaults to empty map."
}
