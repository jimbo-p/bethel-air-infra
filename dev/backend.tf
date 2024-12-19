terraform {
  backend "s3" {
    region         = "us-east-1"
    bucket         = "dev-bethel-air-tfstate"
    key            = "terraform/state/terraform.tfstate"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}