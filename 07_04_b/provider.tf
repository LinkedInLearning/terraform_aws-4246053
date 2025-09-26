terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.76.0"
    }
  }
  backend "s3" {
    bucket = "backend-projet-aws-s3-bucket-21-11-2024"
    key    = "states/terraform.state"
    region = "eu-west-1"
  }
}

provider "aws" {
  region = var.region
}
