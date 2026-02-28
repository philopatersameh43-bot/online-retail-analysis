SQL README — Online Retail (MySQL)

Purpose
This folder contains the SQL work used to prepare a **clean BI-ready dataset** for Power BI.

The goal in SQL is to:
- Load the raw data into MySQL
- Fix data type issues
- Clean and filter records
- Create a clean view that Power BI can import reliably

Key Steps Performed
1) Data Load (Staging Table)
- Imported the CSV into a staging table (e.g., `online_retail_stage`)
- Used appropriate data types for analytical use:
  - `Quantity` as INT
  - `UnitPrice` as DECIMAL (precision adjusted to prevent truncation)

2) Cleaning Logic (BI-ready View)
A clean view (e.g., `v_sales_clean`) was created to:
- Remove cancelled invoices:
  - `InvoiceNo NOT LIKE 'C%'`
- Remove invalid transactions:
  - `Quantity > 0`
  - `UnitPrice > 0`
- Remove missing CustomerID rows:
  - `CustomerID IS NOT NULL AND TRIM(CustomerID) <> ''`
  (Prevents blank keys breaking relationships in Power BI)
- Fix CustomerID formatting issues (e.g., trailing `.0`) using trimming/casting
- Create `Revenue`:
  - `ROUND(Quantity * UnitPrice, 2) AS Revenue`

Output
Final SQL output is a clean table/view ready to import to Power BI:
- consistent values
- valid keys for relationships
- revenue calculated correctly

