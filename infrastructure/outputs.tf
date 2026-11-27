output "project_name" {
  description = "Lakehouse project name"
  value       = var.project_name
}

output "environment" {
  description = "Deployment environment"
  value       = var.environment
}

output "aws_region" {
  description = "AWS deployment region"
  value       = var.aws_region
}

output "resource_prefix" {
  description = "Common resource naming prefix"
  value       = local.name_prefix
}

output "aws_account_id_length" {
  description = "AWS authentication validation"
  value       = length(data.aws_caller_identity.current.account_id)
}

output "lakehouse_bucket_name" {
  description = "Name of the lakehouse S3 bucket"
  value       = module.storage.bucket_name
}

output "lakehouse_bucket_arn" {
  description = "ARN of the lakehouse S3 bucket"
  value       = module.storage.bucket_arn
}

output "lakehouse_paths" {
  description = "Lakehouse storage layer paths"
  value       = module.storage.paths
}

output "glue_role_name" {
  description = "Glue execution role name"
  value       = aws_iam_role.glue.name
}

output "glue_role_arn" {
  description = "Glue execution role ARN"
  value       = aws_iam_role.glue.arn
}

output "glue_databases" {
  description = "Glue Data Catalog databases by lakehouse layer"

  value = {
    for layer, database in aws_glue_catalog_database.lakehouse :
    layer => database.name
  }
}

output "glue_log_groups" {
  description = "CloudWatch log groups for Glue jobs"

  value = {
    error  = aws_cloudwatch_log_group.glue_error.name
    output = aws_cloudwatch_log_group.glue_output.name
  }
}

output "batch_control_table_name" {
  description = "DynamoDB batch control table name"
  value       = aws_dynamodb_table.batch_control.name
}

output "batch_control_table_arn" {
  description = "DynamoDB batch control table ARN"
  value       = aws_dynamodb_table.batch_control.arn
}

output "neon_oltp_secret_arn" {
  description = "ARN of the Neon OLTP connection secret"
  value       = aws_secretsmanager_secret.neon_oltp.arn
}

output "neon_dw_secret_arn" {
  description = "ARN of the Neon DW connection secret"
  value       = aws_secretsmanager_secret.neon_dw.arn
}
