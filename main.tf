terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  backend "local" {
    path = "terraform.tfstate"
  }

  required_version = ">= 1.2.5"
}

provider "aws" {
  region = "us-east-1"
  alias  = "primary_region"
}

provider "aws" {
  region = "us-west-1"
  alias  = "secondary_region"
}
