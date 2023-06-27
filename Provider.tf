terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.4.0"
    }
  }
  backend "s3" {
    bucket = "terra-tfstate012"
    key    = "states/terra-tfstate012"
    region = "us-east-1"
  }
}
provider "aws" {
  # Configuration options
  region = "us-east-1"
}
