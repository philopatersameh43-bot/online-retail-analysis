SELECT
  COUNT(*) AS total_rows,
  SUM(CustomerID IS NULL OR CustomerID = '') AS missing_customerid,
  SUM(Description IS NULL OR TRIM(Description) = '') AS missing_description,
  SUM(Quantity <= 0) AS non_positive_quantity,
  SUM(UnitPrice <= 0) AS non_positive_unitprice,
  SUM(InvoiceNo LIKE 'C%') AS cancelled_invoices_rows
  FROM online_retail_raw;
  
