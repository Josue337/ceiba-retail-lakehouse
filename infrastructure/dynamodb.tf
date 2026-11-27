resource "aws_dynamodb_table" "batch_control" {
  name         = "${local.name_prefix}-batches"
  billing_mode = "PAY_PER_REQUEST"

  hash_key  = "batch_id"
  range_key = "stage"

  attribute {
    name = "batch_id"
    type = "S"
  }

  attribute {
    name = "stage"
    type = "S"
  }

  server_side_encryption {
    enabled = true
  }

  deletion_protection_enabled = false

  tags = {
    Name = "${local.name_prefix}-batches"
  }
}
