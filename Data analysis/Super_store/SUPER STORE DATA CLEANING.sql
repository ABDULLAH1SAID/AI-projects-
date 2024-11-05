CREATE DATABASE Sales ;
use Sales ;
-- copy of the data
CREATE DATABASE Backup_Sales ; 
USE Backup_Sales;
CREATE TABLE Backup_sample_superstore
AS SELECT * FROM Sales.`sample - superstore`;
SELECT * FROM  Backup_sample_superstore;

USE Sales ;
SET SQL_SAFE_UPDATES = 0;

RENAME TABLE `sample - superstore` TO superstore;
SELECT * FROM  superstore ; 

DESC superstore;

UPDATE superstore 
SET `Order Date` = DATE_FORMAT(STR_TO_DATE(`Order Date`, "%m/%d/%Y"), "%Y-%m-%d") ;

UPDATE superstore 
SET `Ship Date` = DATE_FORMAT(STR_TO_DATE(`Ship Date`, "%m/%d/%Y"), "%Y-%m-%d") ;

ALTER TABLE superstore
MODIFY COLUMN `Order Date` DATE;

ALTER TABLE superstore
MODIFY COLUMN `Ship Date` DATE;

-- Check duplicate values
 SELECT *
FROM (
    SELECT *, 
           ROW_NUMBER() OVER(PARTITION BY `Row ID`, `Order ID`, `Order Date`, `Ship Date`, 
                             `Ship Mode`, `Customer ID`, `Customer Name`, `Segment`, `Country`, 
                             `City`, `State`, `Postal Code`, `Region`, `Product ID`, 
                             `Category`, `Product Name`, `Sales`
           ) AS row_num
    FROM superstore
) AS subquery
WHERE row_num > 1;	 