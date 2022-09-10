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

module "lambda_layer_us_east_1" {
  source         = "./modules/layer"
  for_each       = var.python_version
  python_version = each.value
  providers = {
    aws = aws.us_east_1
  }
}

module "lambda_layer_sa_east_1" {
  source         = "./modules/layer"
  for_each       = var.python_version
  python_version = each.value
  providers = {
    aws = aws.sa_east_1
  }
}