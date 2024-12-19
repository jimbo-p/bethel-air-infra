terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}
provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      environment = var.environment
      application = var.application-name
      author = "bethel"
      CreatedWithTerraform = "true"
    }
  }
}