terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  required_version = ">= 1.16.0"
}

provider "aws" {
  region = "ap-south-1"
}

data "aws_instance" "devops_server" {
  instance_id = "i-07ae8e11b529cb9fd"
}

