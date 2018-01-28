resource "aws_cloudwatch_event_rule" "cloudwatch_lambda_trigger" {
  name        = "trigger_lambda"
  description = "Call Lambda function automatically"
  schedule_expression = "${var.lambda_cloudwatch_schedule}"
}

resource "aws_cloudwatch_event_target" "lambda_target" {
  rule      = "${aws_cloudwatch_event_rule.cloudwatch_lambda_trigger.name}"
  target_id = "TriggerLambda"
  arn       = "${aws_lambda_function.lambda_health_check.arn}"
}

resource "aws_lambda_permission" "cloudwatch_lambda_permission" {
  statement_id = "AllowExecutionFromCloudWatch"
  action = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.lambda_health_check.function_name}"
  principal = "events.amazonaws.com"
  source_arn = "${aws_cloudwatch_event_rule.cloudwatch_lambda_trigger.arn}"
}
