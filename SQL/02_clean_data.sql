SELECT InvoiceDate FROM online_retail_stage LIMIT 5;

ALTER TABLE online_retail_stage
MODIFY InvoiceDate DATETIME;

select count(CustomerID)
from v_sales_clean
where CustomerID ='';

CREATE OR REPLACE VIEW v_sales_clean AS
SELECT
InvoiceNo,
StockCode,
Description,
Quantity,
UnitPrice,
round(Quantity * UnitPrice, 2)  AS Revenue,
InvoiceDate, 
TRIM(TRAILING '.0' FROM CustomerID) AS CustomerID,
Country
FROM online_retail_stage
WHERE
Quantity > 0
AND UnitPrice > 0
AND InvoiceNo NOT LIKE 'C%'
AND CustomerID IS NOT NULL
AND TRIM(CustomerID) <> '';  
    
select *
from v_sales_clean;
    
    GRANT SELECT, SHOW VIEW 
ON online_retail_ii.* 
TO 'powerbi'@'localhost';



    