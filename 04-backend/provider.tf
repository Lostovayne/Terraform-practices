terraform {
  required_version = ">= 1.14.8"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }

  backend "s3" {
    bucket       = "deus-terraform-state-20260420-001"
    key          = "04-backend/myterraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
  }

}

provider "aws" {
  region = "us-east-1"
}
