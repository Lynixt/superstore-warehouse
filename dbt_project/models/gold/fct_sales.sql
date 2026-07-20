SELECT
    s.order_id,
    s.order_date,
    c.customer_id,
    p.product_id,
    s.quantity,
    s.unit_price,
    s.discount,
    s.total_amount
FROM {{ ref('stg_sales') }} s
LEFT JOIN {{ ref('dim_customer') }} c ON s.customer_id = c.customer_id
LEFT JOIN {{ ref('dim_product') }} p ON s.product_id = p.product_id