
  
    

  create  table "superstore"."public"."fct_sales__dbt_tmp"
  
  
    as
  
  (
    SELECT
    s.order_id,
    s.order_date,
    c.customer_id,
    p.product_id,
    s.quantity,
    s.unit_price,
    s.discount,
    s.total_amount
FROM "superstore"."public"."stg_sales" s
LEFT JOIN "superstore"."public"."dim_customer" c ON s.customer_id = c.customer_id
LEFT JOIN "superstore"."public"."dim_product" p ON s.product_id = p.product_id
  );
  