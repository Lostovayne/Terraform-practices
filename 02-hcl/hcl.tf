terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>6"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# Bucket S3 gestionado activamente
resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name
}

# Gestionado en otro lugar, solo queremos referenciarlo aquí
data "aws_s3_bucket" "my_external_bucket" {
  bucket = aws_s3_bucket.my_bucket.bucket
}

variable "bucket_name" {
  type        = string
  description = "My variable used to set bucket name"
  default     = "my-sample-bucket-12"
}


output "bucket_id" {
  value = aws_s3_bucket.my_bucket.id
}


locals {
  local_example = "This is a local variable example"
}

module "my_module" {
  source = "./module-example"
}
