output "bucket_name" {
  description = "Lakehouse bucket name"
  value       = aws_s3_bucket.lakehouse.id
}

output "bucket_arn" {
  description = "Lakehouse bucket ARN"
  value       = aws_s3_bucket.lakehouse.arn
}

output "paths" {
  description = "Lakehouse storage paths"

  value = {
    landing    = "s3://${aws_s3_bucket.lakehouse.id}/landing/"
    bronze     = "s3://${aws_s3_bucket.lakehouse.id}/bronze/"
    silver     = "s3://${aws_s3_bucket.lakehouse.id}/silver/"
    gold       = "s3://${aws_s3_bucket.lakehouse.id}/gold/"
    quarantine = "s3://${aws_s3_bucket.lakehouse.id}/quarantine/"
    artifacts  = "s3://${aws_s3_bucket.lakehouse.id}/artifacts/"
    athena     = "s3://${aws_s3_bucket.lakehouse.id}/athena-results/"
  }
}
