data "aws_iam_policy_document" "glue_assume_role" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["glue.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "glue" {
  name               = "${local.name_prefix}-glue-role"
  assume_role_policy = data.aws_iam_policy_document.glue_assume_role.json

  tags = {
    Name = "${local.name_prefix}-glue-role"
  }
}

data "aws_iam_policy_document" "glue_storage" {
  statement {
    sid    = "ListLakehouseBucket"
    effect = "Allow"

    actions = [
      "s3:ListBucket",
      "s3:GetBucketLocation"
    ]

    resources = [
      module.storage.bucket_arn
    ]
  }

  statement {
    sid    = "ReadLakehouseObjects"
    effect = "Allow"

    actions = [
      "s3:GetObject"
    ]

    resources = [
      "${module.storage.bucket_arn}/landing/*",
      "${module.storage.bucket_arn}/bronze/*",
      "${module.storage.bucket_arn}/silver/*",
      "${module.storage.bucket_arn}/gold/*",
      "${module.storage.bucket_arn}/artifacts/*",
      "${module.storage.bucket_arn}/quarantine/*"
    ]
  }

  statement {
    sid    = "WriteProcessedObjects"
    effect = "Allow"

    actions = [
      "s3:PutObject",
      "s3:AbortMultipartUpload"
    ]

    resources = [
      "${module.storage.bucket_arn}/bronze/*",
      "${module.storage.bucket_arn}/silver/*",
      "${module.storage.bucket_arn}/gold/*",
      "${module.storage.bucket_arn}/quarantine/*",
      "${module.storage.bucket_arn}/artifacts/temp/*"
    ]
  }
}

resource "aws_iam_policy" "glue_storage" {
  name        = "${local.name_prefix}-glue-storage"
  description = "Storage permissions for Ceiba Glue jobs"
  policy      = data.aws_iam_policy_document.glue_storage.json
}

resource "aws_iam_role_policy_attachment" "glue_storage" {
  role       = aws_iam_role.glue.name
  policy_arn = aws_iam_policy.glue_storage.arn
}

data "aws_iam_policy_document" "glue_logs" {
  statement {
    sid    = "WriteGlueLogs"
    effect = "Allow"

    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]

    resources = [
      "arn:aws:logs:${var.aws_region}:${data.aws_caller_identity.current.account_id}:log-group:/aws-glue/*"
    ]
  }
}

resource "aws_iam_role_policy" "glue_logs" {
  name   = "${local.name_prefix}-glue-logs"
  role   = aws_iam_role.glue.id
  policy = data.aws_iam_policy_document.glue_logs.json
}

data "aws_iam_policy_document" "glue_catalog" {
  statement {
    sid    = "ManageLakehouseCatalog"
    effect = "Allow"

    actions = [
      "glue:GetDatabase",
      "glue:GetTable",
      "glue:GetTables",
      "glue:CreateTable",
      "glue:UpdateTable",
      "glue:GetPartition",
      "glue:GetPartitions",
      "glue:BatchGetPartition",
      "glue:CreatePartition",
      "glue:BatchCreatePartition",
      "glue:UpdatePartition",
      "glue:GetTableVersion",
      "glue:GetTableVersions"
    ]

    resources = concat(
      [
        "arn:aws:glue:${var.aws_region}:${data.aws_caller_identity.current.account_id}:catalog"
      ],
      [
        for database in aws_glue_catalog_database.lakehouse :
        database.arn
      ],
      [
        for database in aws_glue_catalog_database.lakehouse :
        "arn:aws:glue:${var.aws_region}:${data.aws_caller_identity.current.account_id}:table/${database.name}/*"
      ]
    )
  }
}

resource "aws_iam_role_policy" "glue_catalog" {
  name   = "${local.name_prefix}-glue-catalog"
  role   = aws_iam_role.glue.id
  policy = data.aws_iam_policy_document.glue_catalog.json
}

data "aws_iam_policy_document" "glue_batch_control" {
  statement {
    sid    = "ManageBatchProcessingState"
    effect = "Allow"

    actions = [
      "dynamodb:DescribeTable",
      "dynamodb:GetItem",
      "dynamodb:PutItem",
      "dynamodb:UpdateItem",
      "dynamodb:Query"
    ]

    resources = [
      aws_dynamodb_table.batch_control.arn
    ]
  }
}

resource "aws_iam_role_policy" "glue_batch_control" {
  name   = "${local.name_prefix}-glue-batches"
  role   = aws_iam_role.glue.id
  policy = data.aws_iam_policy_document.glue_batch_control.json
}

data "aws_iam_policy_document" "glue_secrets" {
  statement {
    sid    = "ReadNeonConnectionSecrets"
    effect = "Allow"

    actions = [
      "secretsmanager:GetSecretValue",
      "secretsmanager:DescribeSecret"
    ]

    resources = [
      aws_secretsmanager_secret.neon_oltp.arn,
      aws_secretsmanager_secret.neon_dw.arn
    ]
  }
}

resource "aws_iam_role_policy" "glue_secrets" {
  name   = "${local.name_prefix}-glue-secrets"
  role   = aws_iam_role.glue.id
  policy = data.aws_iam_policy_document.glue_secrets.json
}
