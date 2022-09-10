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


# resource "aws_lambda_layer_version" "lambda_layer" {
#   provider                 = aws.us_east_1
#   filename                 = "/tmp/python37.zip"
#   layer_name               = "alexa_skill_python_minimal"
#   compatible_architectures = ["x86_64"]
#   compatible_runtimes      = ["python3.7"]
#   license_info             = "MIT"
#   description              = "Python Lambda Layer with minimal packages for alex skills"
#   source_code_hash         = filebase64sha256("/tmp/python37.zip")
# }

# resource "aws_lambda_layer_version_permission" "lambda_layer" {
#   provider       = aws.us_east_1
#   layer_name     = aws_lambda_layer_version.lambda_layer.layer_arn
#   version_number = aws_lambda_layer_version.lambda_layer.version
#   principal      = "*"
#   action         = "lambda:GetLayerVersion"
#   statement_id   = "alexa_skill_python_minimal"
# }