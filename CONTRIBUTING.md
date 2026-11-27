# Contributing

## Workflow

1. Synchronize the main branch.
2. Create a feature branch.
3. Implement the assigned task.
4. Run the corresponding tests.
5. Review the changes.
6. Create a Conventional Commit.
7. Push the feature branch.
8. Open a Pull Request.
9. Request a review.
10. Merge approved changes.

## Branch naming

- feat/infrastructure
- feat/historical-ingestion
- feat/bronze-pipeline
- feat/silver-pipeline
- feat/gold-model
- feat/dashboard-prototype
- feat/serverless-api
- fix/description
- docs/description

## Commit conventions

- feat: new functionality
- fix: bug correction
- docs: documentation
- test: automated tests
- refactor: internal restructuring
- chore: maintenance
- ci: continuous integration

## Rules

- Do not commit directly to main.
- Do not commit credentials or original datasets.
- Do not overwrite another member's work.
- Keep Pull Requests focused.
- Each member must author their own contributions.
- Coordinate changes to shared dependencies.
- Document relevant architectural decisions.

## Quality checks

    uv run ruff check .
    uv run ruff format --check .
    uv run pytest
