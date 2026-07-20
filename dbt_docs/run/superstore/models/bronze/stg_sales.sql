
  create view "superstore"."public"."stg_sales__dbt_tmp"
    
    
  as (
    SELECT
    order_id,
    order_date::DATE AS order_date,
    customer_id,
    customer_name,
    city,
    country,
    segment,
    product_id,
    product_name,
    category,
    sub_category,
    unit_price::NUMERIC AS unit_price,
    quantity::INTEGER AS quantity,
    discount::NUMERIC AS discount,
    unit_price * quantity * (1 - discount) AS total_amount
FROM raw_sales
  );