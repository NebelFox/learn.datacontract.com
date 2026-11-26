CREATE SCHEMA IF NOT EXISTS analytics;

CREATE OR REPLACE VIEW analytics.sku_sales_per_year AS
SELECT
    sku,
    EXTRACT(YEAR FROM order_timestamp)::int as year,
    count(*) as order_count,
    sum(i.quantity)::bigint as total_quantity
from sku_sales_input.line_items as i
join sku_sales_input.orders as o
on i.order_id = o.order_id
group by sku, 2;
