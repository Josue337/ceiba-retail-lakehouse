# Project Status

Last update: 2026-11-27

## Current phase

Phase 3 - Infrastructure Foundation

## Team

| Member | Proposed responsibility |
|---|---|
| Josue | AWS, Terraform, ingestion and orchestration |
| Member 2 | PySpark, Bronze, Silver and Gold |
| Member 3 | Dashboard, backend and API |

Assignments are provisional.

## Completed

- [x] Academic requirements identified.
- [x] Historical database restored in Neon.
- [x] Source database schema inspected.
- [x] Incremental file structures inspected.
- [x] GitHub repository created.
- [x] Repository cloned in WSL.
- [x] Python 3.11 configured.
- [x] uv project initialized.
- [x] Development dependencies installed.
- [x] Initial environment test passed.

## In progress

- [x] Repository documentation.
- [x] Project-specific gitignore.
- [x] Bootstrap Pull Request.

## Next tasks

- [x] Install AWS CLI.
- [x] Install Terraform.
- [x] Configure AWS authentication.
- [x] Implement initial Terraform foundation.
- [ ] Refactor Terraform into academic modules.
- [ ] Configure Landing Crawler.
- [ ] Configure AWS Budgets alerts.
- [ ] Deploy Terraform foundation.
- [ ] Implement historical ingestion.
- [ ] Implement Bronze processing.
- [ ] Build dashboard prototype.

## Academic milestones

### 2026-11-30 - Advance 1

- [x] Neon OLTP restored.
- [ ] Terraform foundation deployed.
- [ ] Historical data in Landing.
- [ ] Bronze layer processed.
- [ ] Dashboard prototype.

### 2026-12-02 - Advance 2

- [ ] Silver deduplication.
- [ ] Incremental batches 01 and 02.
- [ ] Gold dimensional model.
- [ ] At least one API endpoint.

### 2026-12-09 - Final demonstration

- [ ] Complete Step Functions pipeline.
- [ ] Public dashboard.
- [ ] Live batch 03 processing.
- [ ] Terraform destroy evidence.

## Pending decisions

- AWS deployment region selected: us-east-1.
- Existing Neon OLTP region: us-east-2.
- Verify Neon regional requirements.
- AWS Glue runtime verification.
- Incremental update semantics.
- Final dimensional model.
- Final frontend stack.
- Preliminary infrastructure budget: USD 12.31.
- Verify estimates in AWS Pricing Calculator.
- Define Terraform state management.

## Validation evidence

- Python: 3.11.18.
- Ruff lint: passed.
- Ruff format: passed.
- Pytest: 1 passed.
- AWS CLI: 2.42.5.
- Terraform: 1.17.2.
- Java: 17.
- PostgreSQL client: 18.6.
- AWS authentication: passed.
- Terraform format: passed.
- Terraform validate: passed.
- Terraform plan: 22 to add, 0 to change, 0 to destroy.
- AWS deployment region: us-east-1.
- AWS resources deployed: 0.

## Next step

Refactor the validated Terraform foundation into modules and prepare the first deployment.
