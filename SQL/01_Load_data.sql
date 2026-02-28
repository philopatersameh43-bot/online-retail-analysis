CREATE TABLE online_retail_stage (
  InvoiceNo   VARCHAR(20),
  StockCode   VARCHAR(50),
  Description VARCHAR(255),
  Quantity    INT,
  InvoiceDate VARCHAR(50),     
  UnitPrice   DECIMAL(10,3),
  CustomerID  VARCHAR(50),
  Country     VARCHAR(100)
);

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/online_retail_II.csv"
INTO TABLE online_retail_stage
CHARACTER SET latin1
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(InvoiceNo, StockCode, Description, Quantity, InvoiceDate, UnitPrice, CustomerID, Country);

