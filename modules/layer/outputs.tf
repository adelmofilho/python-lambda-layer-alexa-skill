output "lambda_layer_arn" {
  description = "ARN of the created lambda layer"
  value       = aws_lambda_layer_version.lambda_layer.arn
}