SQL Workflow – Online Retail Analysis

This folder contains the structured SQL pipeline used to transform raw retail transaction data into analysis-ready KPI views for reporting and dashboarding.

The workflow follows a clear data engineering process:
Raw Data → Data Quality Audit → Data Cleaning → KPI Views

Files Included

01_load_data.sql
Loads the raw Online Retail dataset into MySQL.

02_data_audit.sql
Performs data quality checks including:
- Missing values
- Duplicate records
- Negative quantities
- Zero/invalid unit prices
- Cancelled invoices

03_data_cleaning.sql
Cleans and prepares the dataset by:
- Removing invalid records
- Handling duplicates
- Standardizing structure
- Creating a clean analytical table

04_views_kpi.sql
Creates aggregated KPI views used for reporting and Power BI dashboarding:
- Total revenue
- Total orders
- Total customers
- Average order value
- Revenue by country
- Monthly revenue trends


Execution Order

Run the scripts in the following order:

1. 01_load_data.sql  
2. 02_data_audit.sql  
3. 03_data_cleaning.sql  
4. 04_views_kpi.sql  


Tools & Concepts Used

- MySQL
- Data Quality Validation
- Aggregations & KPI Calculations
- GROUP BY, HAVING
- Subqueries
- View Creation
- Structured Analytical Workflow


What This Demonstrates

- Strong SQL fundamentals
- End-to-end data preparation process
- Data quality awareness
- KPI modeling for business reporting
- Clean and structured analytical thinking
