select database();
show variables like 'local_infile';
set global local_infile=1;
 
CREATE TABLE online_retail_raw (
    InvoiceNo   TEXT,
    StockCode   TEXT,
    Description TEXT,
    Quantity    INT,
    InvoiceDate TEXT,
    UnitPrice   DOUBLE,
    CustomerID  TEXT,
    Country     TEXT
);

USE retail_online;
TRUNCATE TABLE online_retail_raw;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/OnlineRetail.csv'
INTO TABLE online_retail_raw
CHARACTER SET latin1
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(InvoiceNo, StockCode, Description, Quantity, InvoiceDate, UnitPrice, CustomerID, Country);


















