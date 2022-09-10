terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

resource "aws_lambda_layer_version" "lambda_layer" {
  filename                 = "/tmp/${var.python_version}.zip"
  layer_name               = "${var.layer_name}_${replace(var.python_version, ".", "")}"
  compatible_architectures = [var.compatible_architectures]
  compatible_runtimes      = [var.python_version]
  license_info             = var.license_info
  description              = var.description
  source_code_hash         = filebase64sha256("/tmp/${var.python_version}.zip")
}

resource "aws_lambda_layer_version_permission" "lambda_layer" {
  layer_name     = aws_lambda_layer_version.lambda_layer.layer_arn
  version_number = aws_lambda_layer_version.lambda_layer.version
  principal      = "*"
  action         = "lambda:GetLayerVersion"
  statement_id   = var.statement_id
}