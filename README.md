# Superstore Data Warehouse

A dimensional data warehouse built with dbt and PostgreSQL. Transforms raw sales data into a star schema with data quality tests and documentation.

## Architecture

```
[raw_sales] (1000 rows, CSV loaded into PostgreSQL)
     │
     ▼
[stg_sales] (Bronze - view)
     │  Cleaned types, calculated total_amount
     │
     ├── [dim_customer] (Silver - table)
     ├── [dim_product]  (Silver - table)
     └── [dim_date]     (Silver - table)
     │
     ▼
[fct_sales] (Gold - table)
     JOINs all dimensions
```

## Star Schema

| Table          | Type      | Grain                  | Row Count |
| -------------- | --------- | ---------------------- | --------- |
| `dim_customer` | Dimension | One row per customer   | 8         |
| `dim_product`  | Dimension | One row per product    | 10        |
| `dim_date`     | Dimension | One row per day        | ~1095     |
| `fct_sales`    | Fact      | One row per order line | 1000      |

## Data Quality

8 tests across all dimensions:

- `unique` on primary keys (customer_id, product_id, date_id)
- `not_null` on required fields
- `accepted_values` on customer segment

Run tests: `docker exec -it superstore_dbt dbt test`

## Tech Stack

- **dbt 1.7** (data transformation)
- **PostgreSQL 15** (data warehouse)
- **Docker & Docker Compose** (containerization)
- **Python** (data generation)

## How to Run

1. Clone the repo

   ```
   git clone https://github.com/Lynixt/superstore-warehouse.git
   cd superstore-warehouse
   ```

2. Start the database

   ```
   docker compose up -d
   ```

3. Generate sample data and load via dbt seed

   ```
   python generate_data.py
   docker compose up -d --build
   docker exec -it superstore_dbt dbt seed
   ```

4. Run dbt

   ```
   docker exec -it superstore_dbt dbt run
   docker exec -it superstore_dbt dbt test
   ```

5. View documentation
   ```
   docker cp superstore_dbt:/usr/app/target ./dbt_docs
   cd dbt_docs
   python -m http.server 8081
   ```
   Open http://localhost:8081 for lineage graphs and documentation.

## Project Structure

```
dbt_project/
├── models/
│   ├── bronze/
│   │   └── stg_sales.sql
│   ├── silver/
│   │   ├── dim_customer.sql
│   │   ├── dim_product.sql
│   │   ├── dim_date.sql
│   │   └── schema.yml
│   └── gold/
│       └── fct_sales.sql
├── dbt_project.yml
└── profiles.yml
```

## What I Learned

- Building a star schema from raw data
- dbt models, refs, materializations, and dependency graphs
- Data quality testing with schema.yml
- Medallion architecture (Bronze → Silver → Gold)
- Lineage visualization with dbt docs
- Dimensional modeling: facts, dimensions, surrogate keys

## Portfolio

This is Project 2 of 3 in my data engineering portfolio.

- [Project 1: Broken Miner](https://github.com/Lynixt/Broken-Miner) - Airflow, Docker, Telegram alerts
- **Project 2: Superstore Warehouse** - dbt, dimensional modeling, data quality
