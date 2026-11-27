# Ceiba Retail Lakehouse

Plataforma distribuida de ingeniería de datos y
analítica retail sobre AWS.

## Objetivo

Procesar información histórica e incremental de una
cadena comercial ficticia de Colombia mediante una
arquitectura Lakehouse.

## Arquitectura

Neon OLTP → Landing → Bronze → Silver → Gold
→ Neon DW → API REST → Dashboard

## Stack tecnológico

- AWS S3
- AWS Glue y PySpark
- Amazon Athena
- AWS Step Functions
- Amazon DynamoDB
- AWS Lambda
- Amazon API Gateway
- PostgreSQL en Neon
- Terraform
- Python 3.11
- uv
- Next.js y TypeScript (propuestos)

## Desarrollo local

Requisitos iniciales:

- Git
- uv
- Python 3.11

Instalar las dependencias:

    uv sync

Ejecutar las pruebas:

    uv run pytest

Verificar la calidad del código:

    uv run ruff check .
    uv run ruff format --check .

## Datos

Los datos originales se almacenan fuera del repositorio.
No se deben versionar credenciales, dumps ni archivos
transaccionales.

## Documentación

- AGENTS.md: instrucciones de ingeniería.
- CONTRIBUTING.md: flujo de colaboración.
- PROJECT_STATUS.md: estado del proyecto.

## Estado

Proyecto en desarrollo.
