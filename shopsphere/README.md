# ShopSphere Data Stack

ShopSphere is a local data-mining workspace containing sample e-commerce data and a Docker Compose stack for PostgreSQL and MinIO.

## Project Contents

- `postgres/init.sql` - creates and seeds the customers, products, orders, and order-items tables.
- `data/inventory.csv` - warehouse inventory data.
- `data/sales.csv` - sales transactions and discounts.
- `data/campaigns.json` - marketing campaign data.
- `duckdb/analytics.duckdb` - DuckDB analytics database.
- `docker-compose.yml` - local PostgreSQL and MinIO services.

## Requirements

- Docker with Docker Compose support
- DuckDB CLI, if you want to query the included analytics database directly

## Start the Services

From the project root:

```bash
docker compose up -d
```

Check service status and logs:

```bash
docker compose ps
docker compose logs -f postgres
```

The PostgreSQL container is exposed on `localhost:5433` and the MinIO services are exposed on:

- S3 API: `http://localhost:9000`
- MinIO Console: `http://localhost:9001`

## PostgreSQL Connection

The development connection settings are:

| Setting | Value |
| --- | --- |
| Host | `localhost` |
| Port | `5433` |
| Database | `shopsphere` |
| User | `shopsphere` |
| Password | `shopsphere` |

Connect with `psql`:

```bash
psql "postgresql://shopsphere:shopsphere@localhost:5433/shopsphere"
```

The initialization script runs only when the PostgreSQL data volume is created for the first time. To recreate the database from the seed script:

```bash
docker compose down -v
docker compose up -d
```

The `-v` option deletes the local PostgreSQL and MinIO named volumes, so use it only when resetting local data is intended.

## DuckDB

Query the included analytics database from the project root:

```bash
duckdb duckdb/analytics.duckdb
```

For example:

```sql
SHOW TABLES;
```

## Stop the Services

```bash
docker compose down
```

This stops the containers while preserving their named volumes.

## Notes

The credentials in `docker-compose.yml` are intended for local development only. Replace them with secrets or environment variables before using this stack outside a local environment.