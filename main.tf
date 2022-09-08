# Configure Terraform SDK
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
        }
    }
  backend "remote" {
    organization = "shared"
    hostname     = "app.terraform.io"
    workspaces {
      name = "python-lambda-layer-alexa-skill"
        }
    }
}