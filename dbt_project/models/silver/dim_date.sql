WITH date_range AS (
    SELECT
        generate_series(
            (SELECT MIN(order_date) FROM {{ ref('stg_sales') }}),
            (SELECT MAX(order_date) FROM {{ ref('stg_sales') }}),
            '1 day'::INTERVAL
        ) AS date_day
)

SELECT
    date_day AS date_id,
    date_day,
    EXTRACT(YEAR FROM date_day) AS year,
    EXTRACT(MONTH FROM date_day) AS month,
    EXTRACT(QUARTER FROM date_day) AS quarter,
    TO_CHAR(date_day, 'Month') AS month_name,
    EXTRACT(DOW FROM date_day) AS day_of_week,
    CASE WHEN EXTRACT(DOW FROM date_day) IN (0, 6) THEN TRUE ELSE FALSE END AS is_weekend
FROM date_range
ORDER BY date_day