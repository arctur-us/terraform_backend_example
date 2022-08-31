terraform {
  required_version = ">= 0.13.1"

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 4.25.0"
    }
  }
  backend "local" {
    path = "terraform.tfstate"
  }
  
}

provider "aws" {
  region  = "us-east-1"
  alias   = "primary_region"
  profile = "default"
}

provider "aws" {
  region  = "us-west-1"
  alias   = "secondary_region"
  profile = "default"
}