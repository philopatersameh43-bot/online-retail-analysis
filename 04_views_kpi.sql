SELECT
  COUNT(*) AS Total_rows,
  COUNT(DISTINCT invoice_no) AS orders,
  COUNT(DISTINCT customer_id) AS customers,
  SUM(sales) AS revenue,
  AVG(sales) AS avg_line_revenue
  FROM online_retail_clean;

CREATE OR REPLACE VIEW v_kpi_monthly AS
SELECT
  DATE_FORMAT(invoice_date, '%Y-%m-01') AS month_start,
  COUNT(DISTINCT invoice_no) AS orders,
  COUNT(DISTINCT customer_id) AS customers,
  SUM(sales) AS revenue,
  SUM(quantity) AS items_sold,
  SUM(sales) / COUNT(DISTINCT invoice_no) AS aov
FROM online_retail_clean
GROUP BY DATE_FORMAT(invoice_date, '%Y-%m-01');
 
 select * from v_kpi_monthly order by month_start;
 
 CREATE OR REPLACE VIEW v_country_kpi AS
SELECT
  country,
  SUM(sales) AS revenue,
  COUNT(DISTINCT invoice_no) AS orders,
  COUNT(DISTINCT customer_id) AS customers,
  SUM(quantity) AS items_sold,
  SUM(sales) / COUNT(DISTINCT invoice_no) AS aov
FROM online_retail_clean
GROUP BY country;

SELECT * FROM v_country_kpi ORDER BY revenue DESC;

CREATE OR REPLACE VIEW v_product_kpi AS
SELECT
  stock_code,
  max(description),
  SUM(sales) AS revenue,
  SUM(quantity) AS units_sold,
  COUNT(DISTINCT invoice_no) AS orders
FROM online_retail_clean
GROUP BY stock_code;

select * FROM v_product_kpi ORDER BY revenue desc;

CREATE OR REPLACE VIEW v_sales_daily AS
SELECT
  DATE(invoice_date) AS sales_date,
  SUM(sales) AS revenue,
  COUNT(DISTINCT invoice_no) AS orders,
  COUNT(DISTINCT customer_id) AS customers,
  SUM(quantity) AS items_sold,
  SUM(sales) / COUNT(DISTINCT invoice_no) AS aov
FROM online_retail_clean
GROUP BY DATE(invoice_date);

select * FROM v_sales_daily ORDER BY sales_date;


 