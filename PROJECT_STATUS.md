# Project Status

Last update: 2026-11-27

## Current phase

Phase 1 - Project Bootstrap

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
- [ ] Bootstrap Pull Request.

## Next tasks

- [ ] Install AWS CLI.
- [ ] Install Terraform.
- [ ] Configure AWS authentication.
- [ ] Implement Terraform foundation.
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

- Academic approval of AWS us-east-2.
- AWS Glue runtime verification.
- Incremental update semantics.
- Final dimensional model.
- Final frontend stack.
- Infrastructure cost estimation.

## Validation evidence

- Python: 3.11.18.
- Ruff lint: passed.
- Ruff format: passed.
- Pytest: 1 passed.

## Next step

Complete and merge the project bootstrap.
