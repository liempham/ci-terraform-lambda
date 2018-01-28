variable "aws_region" {
  default = "ap-southeast-1"
}

variable "lambda_memory" {
  default = "128"
}

variable "lambda_runtime" {
  default = "nodejs6.10"
}

variable "lambda_timeout" {
  default = 30
}

variable "lambda_cloudwatch_schedule" {
  default = "cron(0/30 * * * ? *)"
}
