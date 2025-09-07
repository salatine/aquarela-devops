terraform {
  backend "s3" {
    bucket = "aquarela-terraform-state"
    key = "aquarela-devops/terraform.tfstate"
    region = "us-east-1"
  }

  required_version = ">= 1.8.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.34.0"
    }
  }
}
