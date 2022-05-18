#Terraform Block

terraform {
  required_version = "~> v1.1.7"
  required_providers {
    aws = {
      version = "~> 4.5.0"
      source = "hashicorp/aws"
     }


  }
}


provider "aws" {
  region=var.aws-region
  profile="default"
  
}