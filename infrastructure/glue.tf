locals {
  glue_database_prefix = replace(local.name_prefix, "-", "_")

  catalog_layers = toset([
    "bronze",
    "silver",
    "gold"
  ])
}

resource "aws_glue_catalog_database" "lakehouse" {
  for_each = local.catalog_layers

  name = "${local.glue_database_prefix}_${each.key}"

  description = "Ceiba Retail Lakehouse ${each.key} layer"

  location_uri = "s3://${module.storage.bucket_name}/${each.key}/"
}
