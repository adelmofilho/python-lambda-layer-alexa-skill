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

provider "aws" {
  region = "us-east-1"
  alias  = "us_east_1"
}

provider "aws" {
  region = "sa-east-1"
  alias  = "sa_east_1"
}

resource "aws_lambda_layer_version" "lambda_layer" {
  provider                 = aws.us_east_1
  filename                 = "/tmp/python37.zip"
  layer_name               = "alexa_skill_python_minimal"
  compatible_architectures = ["x86_64"]
  compatible_runtimes      = ["python3.7"]
  license_info             = "MIT"
  description              = "Python Lambda Layer with minimal packages for alex skills"
  source_code_hash         = filebase64sha256("python37.zip")
}