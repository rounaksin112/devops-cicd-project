variable "aws_region" {
  description = "AWS region for the Terraform project"
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "devops-cicd-project"
}

variable "security_groups" {
  description = "Security groups to create"
  type = map(object({
    description = string
    port        = number
  }))

  default = {
    application = {
      description = "Application traffic"
      port        = 8081
    }

    monitoring = {
      description = "Monitoring traffic"
      port        = 9090
    }
  }
}
