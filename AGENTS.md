# Engineering Instructions

## Project

Ceiba Retail Lakehouse.

Distributed retail data engineering and analytics on AWS.

## Engineering rules

- Work incrementally.
- Inspect existing code before modifying it.
- Do not invent execution or test results.
- Avoid unnecessary dependencies.
- Use Python 3.11 and uv.
- Use explicit data schemas.
- Preserve monetary precision with decimal types.
- Implement idempotent data pipelines.
- Keep Landing data immutable.
- Preserve business keys.
- Document data quality rules.
- Never expose credentials or customer information.
- Do not modify the source OLTP schema.
- Do not deploy paid resources without approval.
- Do not execute terraform apply or destroy without approval.
- Respect the academic requirements.

## Architecture

- infrastructure/: Terraform.
- pipelines/: data ingestion and transformations.
- orchestration/: Step Functions.
- backend/: serverless API.
- frontend/: dashboard.
- sql/: database scripts.
- tests/: automated tests.
- docs/: technical documentation.

Create directories only when needed.

## Data engineering

Invoice business key:

    cod_tienda + prefijo + numero

Invoice line business key:

    cod_tienda + prefijo + numero + linea

Payment business key:

    cod_tienda + prefijo + numero + secuencia

Customer business key:

    tipo_documento + numero_documento

Business timezone:

    America/Bogota

Do not deduplicate invoices using only numero.
Do not multiply sales amounts through joins with payments.
Do not process lote_03 before the final demonstration.

## Quality gates

    uv run ruff check .
    uv run ruff format --check .
    uv run pytest

## Collaboration

- Use feature branches.
- Use Conventional Commits.
- Submit Pull Requests.
- Update project documentation.
- Preserve individual contribution authorship.
- Review PROJECT_STATUS.md before starting a task.

## Infrastructure

Proposed AWS region: us-east-2.

Academic approval of the region remains pending.

Maximum project budget: 20 USD.

Never commit Terraform state or real secrets.
