CREATE TABLE online_retail_clean (
  invoice_no   VARCHAR(20),
  stock_code   VARCHAR(20),
  description  TEXT,
  quantity     INT,
  invoice_date DATETIME,
  unit_price   DECIMAL(10,2),
  customer_id  INT,
  country      VARCHAR(50),
  sales        DECIMAL(10,2)
);

INSERT INTO online_retail_clean
SELECT
  InvoiceNo,
  StockCode,
  TRIM(Description),
  Quantity,
  STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i'),
  UnitPrice,
  CAST(NULLIF(CustomerID, '') AS UNSIGNED),
  Country,
  Quantity * UnitPrice AS sales
FROM online_retail_raw
WHERE
  InvoiceNo NOT LIKE 'C%'             
  AND Quantity > 0                    
  AND UnitPrice > 0                  
  AND NULLIF(CustomerID, '') IS NOT NULL;
  
  select *
  from online_retail_clean;
  
 SELECT 
  COUNT(*) AS total_rows,
  COUNT(DISTINCT Invoice_No, Stock_Code, Description, Quantity, Invoice_Date, Unit_Price, Customer_ID, Country) AS distinct_rows
 FROM online_retail_clean;

  SELECT COUNT(*) AS duplicate_groups
FROM (
  SELECT 1
  FROM online_retail_clean
  GROUP BY invoice_no, stock_code, description, quantity, invoice_date, unit_price, customer_id, country, sales
  HAVING COUNT(*) > 1
) t;



CREATE TABLE online_retail_clean_rn AS
SELECT *,
ROW_NUMBER() OVER (
PARTITION BY
 invoice_no,
 stock_code,
 description,
 quantity,
 invoice_date,
 unit_price,
 customer_id,
 country,
 sales
ORDER BY invoice_no
  ) AS rn
FROM online_retail_clean;

delete from online_retail_clean_rn
where rn > 1;

DROP TABLE online_retail_clean;

ALTER TABLE online_retail_clean_rn RENAME TO online_retail_clean;

  

