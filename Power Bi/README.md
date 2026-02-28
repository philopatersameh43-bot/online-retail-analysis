Power BI README — Online Retail Store Insights

Purpose
This folder contains the Power BI report built on top of the cleaned MySQL view.

Goal:
- Build a **Star Schema model**
- Create reusable **DAX measures**
- Build an interactive dashboard with reliable filtering

Data Source
Power BI connects to MySQL and imports the cleaned view:
- `v_sales_clean`

Data Modeling (Star Schema)
Fact Table
- `Fact_Sales` (transaction-level sales records)

Dimension Tables
Created from Fact using Reference queries + Remove Duplicates:
- `Dim_Product` (unique by StockCode)
- `Dim_Customer` (unique by CustomerID)
- `Dim_Country` (unique by Country)
- `Dim_Date` (calendar table created with DAX)

Important Modeling Fixes
- Created `InvoiceDateOnly` in Fact_Sales (Date without time) for clean relationship to Dim_Date
- Fixed many-to-many warning by ensuring Dim_Product has unique StockCode
- Fixed sorting issues:
  - `Year-Month` sorted by a numeric `YearMonthSort`
  - `Month Name` sorted by `Month Number`

Measures (DAX)
- Total Revenue** = SUM(Fact_Sales[Revenue])
- Total Quantity** = SUM(Fact_Sales[Quantity])
- Total Orders** = DISTINCTCOUNT(Fact_Sales[InvoiceNo])

Dashboard Pages / Visuals
Main page includes:
- KPI cards: Total Revenue, Total Orders, Total Quantity
- Line chart: Monthly Revenue Trend
- Bar chart: Top 10 Products by Revenue
- Column/Bar chart: Top 10 Countries by Revenue
- Slicers: Year, Month Name, Country

Interactivity
All slicers come from dimension tables (best practice):
- Dim_Date, Dim_Country, etc.
Filters propagate through relationships to Fact_Sales, and measures recalculate dynamically.

File
- `Online_Retail_ii.pbix`
