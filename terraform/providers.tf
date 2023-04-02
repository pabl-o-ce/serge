terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.60.0"
    }
  }
}

# AWS provider
provider "aws" {
  # Add AWS region
  region= var.aws_region
  # Add AWS keys
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
}