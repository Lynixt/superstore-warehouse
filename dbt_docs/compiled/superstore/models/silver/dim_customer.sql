WITH customer_source AS (
    SELECT DISTINCT
        customer_id,
        customer_name,
        city,
        country,
        segment
    FROM "superstore"."public"."stg_sales"
)

SELECT
    customer_id,
    customer_name,
    city,
    country,
    segment
FROM customer_source
ORDER BY customer_id