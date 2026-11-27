# Infrastructure Contract

## Environment

- Project: ceiba-retail-lakehouse
- Environment: dev
- AWS region: us-east-1
- Infrastructure as Code: Terraform
- AWS provider: 6.x

## Storage

One private S3 bucket with the following prefixes:

| Prefix | Purpose |
|---|---|
| landing/historical/ | Historical source extracts |
| landing/incremental/ | Incremental source batches |
| landing/catalogs/ | Original reference catalogs |
| bronze/retail/ | Structured retail data |
| bronze/catalogs/ | Structured reference catalogs |
| silver/retail/ | Validated retail data |
| silver/catalogs/ | Validated reference catalogs |
| gold/dimensions/ | Dimensional model dimensions |
| gold/facts/ | Dimensional model facts |
| quarantine/ | Rejected records |
| artifacts/glue/ | Glue scripts and dependencies |
| artifacts/temp/ | Temporary ETL artifacts |
| athena-results/ | Query results |

## Glue Data Catalog

- ceiba_retail_lakehouse_dev_bronze
- ceiba_retail_lakehouse_dev_silver
- ceiba_retail_lakehouse_dev_gold

## Batch Control

DynamoDB table:

- Name: ceiba-retail-lakehouse-dev-batches
- Partition key: batch_id
- Sort key: stage
- Billing mode: PAY_PER_REQUEST

## Secrets

- ceiba-retail-lakehouse/dev/neon-oltp
- ceiba-retail-lakehouse/dev/neon-dw

Secret values must never be committed to Git
or stored in Terraform configuration.

## Observability

- CloudWatch log retention: 14 days
- Glue error and output logs

## Terraform State

Local state during initial development.
Only the designated infrastructure owner
may execute Terraform apply or destroy.

Remote state migration is pending.

## Deployment Status

Infrastructure configuration validated.
22 resources planned.
No resources deployed yet.

## Operational Rules

- Preserve original landing objects.
- Use explicit schemas for processed data.
- Never process lote_03 before the final demonstration.
- Review costs before executing paid services.
- Obtain approval before apply or destroy.
