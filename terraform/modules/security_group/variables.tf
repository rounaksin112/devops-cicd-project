variable "name" {
  type        = string
  description = "Security group name"
}

variable "description" {
  type        = string
  description = "Security group description"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "port" {
  type        = number
  description = "Application port"
}

variable "tags" {
  type        = map(string)
  description = "Resource tags"
  default     = {}
}
