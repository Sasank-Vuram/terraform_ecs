provider "aws" {
  region = "ap-south-1"
  profile = "sasank"
}

terraform {
  required_providers {
    aws = {
      version = "~> 3.37.0"
    }
  }
}
