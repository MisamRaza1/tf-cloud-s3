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
  region = var.aws_region
}

resource "aws_s3_bucket" "demobucket" {
  bucket = "misamsbucket-tfcloud-${random_id.rand_id.hex}"
}

resource "aws_s3_object" "bucket-data" {
  bucket = aws_s3_bucket.demobucket.bucket
  source = "./myfile.txt"
  key    = "mydata.txt"
}
