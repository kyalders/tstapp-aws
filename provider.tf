terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
  cloud {
    organization = "kylesbx"
    workspaces {
      tags = ["env:#{environment}#", "app:tst-app-kyle"]
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}
