resource "aws_cloudwatch_log_group" "glue_error" {
  name              = "/aws-glue/jobs/error"
  retention_in_days = 14
}

resource "aws_cloudwatch_log_group" "glue_output" {
  name              = "/aws-glue/jobs/output"
  retention_in_days = 14
}
