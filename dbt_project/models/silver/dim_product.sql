WITH product_source AS (
    SELECT DISTINCT
        product_id,
        product_name,
        category,
        sub_category,
        unit_price
    FROM {{ ref('stg_sales') }}
)

SELECT
    product_id,
    product_name,
    category,
    sub_category,
    unit_price
FROM product_source
ORDER BY product_id