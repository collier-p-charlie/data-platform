terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.0.0" # Use the latest version
    }
  }
}

provider "aws" {
  region = var.region

  default_tags {
    tags = {
      ENVIRONMENT  = var.environment
      ACCOUNT_ID   = var.account_id
      MANAGED_BY   = "terraform"
    }
  }
}
