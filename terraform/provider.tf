terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.34.0" #aws provider version, not terraform version
    }
  }

  backend "s3" {
    bucket = "pavanaws-remote-dev"
    key    = "catalogue"
    region = "us-east-1"
    dynamodb_table = "pavanaws-locking-dev"
  }
}

provider "aws" {
  region = "us-east-1"
}