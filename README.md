Online Retail Store Insights (SQL + Power BI)

Overview
This project analyzes e-commerce transactional data (Online Retail) to understand sales performance over time and identify top products and countries by revenue. The workflow uses SQL for cleaning/prep and Power BI for modeling + interactive dashboarding.

What This Project Delivers
- A BI-ready cleaned dataset produced in MySQL (via a clean view)
- A Star Schema model in Power BI (Fact + Dimensions) for reliable filtering
- An interactive dashboard** with slicers (Year / Month / Country) and KPI tracking

Dataset
Online Retail transactional dataset (typical fields):
- InvoiceNo, StockCode, Description
- Quantity, UnitPrice
- InvoiceDate
- CustomerID, Country

Tools
- MySQL: load + clean + prepare data (views)
- Power BI: star schema model + DAX measures + interactive visuals

Workflow Summary
1) SQL (MySQL)
- Loaded raw CSV into a staging table
- Cleaned and standardized fields (data type precision, formatting issues)
- Filtered out invalid rows (e.g., cancelled invoices, non-positive quantity/price)
- Removed missing CustomerID rows to ensure clean relationships in the BI model
- Created a clean view (e.g., `v_sales_clean`) with a computed `Revenue` column

2) Power BI
- Imported the clean SQL view
- Built a Star Schema:
  - `Fact_Sales`
  - `Dim_Product`, `Dim_Customer`, `Dim_Country`, `Dim_Date`
- Created `Dim_Date` (calendar table) with DAX and fixed time sorting:
  - `Year-Month` sorted using a numeric sort column
  - `Month Name` sorted by `Month Number`
- Created DAX measures:
  - Total Revenue, Total Orders (distinct invoices), Total Quantity
- Built an interactive dashboard:
  - KPI cards, Monthly Revenue trend, Top 10 Products, Top 10 Countries
  - Slicers: Year, Month Name, Country

Dashboard Features
- KPI cards: Total Orders, Total Quantity, Total Revenue
- Monthly Revenue trend line
- Top 10 Products by Revenue
- Top 10 Countries by Revenue
- Fully interactive slicers and cross-filtering


