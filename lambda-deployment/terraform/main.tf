provider "aws" {
    region = "${var.aws_region}"
    #Your access & secret key; or use IAM role for EC2
    access_key = "<your access key>" 
    secret_key = "<your secret key>"
}

#### LAMBDA FUNCTION ####

resource "aws_lambda_function" "lambda_health_check" {
    filename = "lambda_health_check.zip"
    function_name = "lambda_health_check"
    handler = "lambda_health_check.handler"
    role = "${aws_iam_role.iam_role_for_lambda.arn}"
    memory_size = "${var.lambda_memory}"
    runtime = "${var.lambda_runtime}"
    timeout = "${var.lambda_timeout}"
    source_code_hash = "${base64sha256(file("lambda_health_check.zip"))}"
}
