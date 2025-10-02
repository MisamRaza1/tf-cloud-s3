terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.13.0"
    }
  }
}

resource "random_id" "rand_id" {
  byte_length = 7
}
provider "aws" {
  # Configuration options
  region = "eu-north-1"
}

resource "aws_s3_bucket" "demobucket" {
  bucket = "misamsbucket-tfcloud-${random_id.rand_id.hex}"
}
