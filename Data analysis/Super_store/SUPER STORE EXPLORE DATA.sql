USE Sales ; 

SELECT * FROM backup_super LIMIT 10;
DESC backup_super;

-- NUMBER OF ROWS IN TABLES 
SELECT COUNT(*) AS TOtal_Rows
FROM superstore ;

-- TOTAL SALES 
SELECT MIN(Sales) FROM superstore ;
SELECT MAX(Sales) FROM superstore ;
SELECT SUM(Sales) FROM superstore ;

-- NUMBER OF ORDERS 
SELECT COUNT( DISTINCT(`Order ID`)) 
AS Total_Orders FROM superstore ;

-- TOP SELLING PRODUCTS
SELECT `Product Name` , SUM(Sales) as `Total Sales` 
FROM superstore 
GROUP BY `Product Name` 
ORDER BY `Total Sales` DESC LIMIT 10 ;

-- TOP  SELLING CATEGORIES 
SELECT Category , SUM(Sales) as `Total Sales` 
FROM superstore 
GROUP BY Category 
ORDER BY `Total Sales` DESC ;

-- TOP TEN CUSTOMERS 
SELECT `Customer Name` , SUM (Sales) as `Total Sales` 
FROM superstore 
GROUP BY `Customer Name` 
ORDER BY `Total Sales` DESC LIMIT 10;

--  SALES BY CITY
SELECT count(DISTINCT(City)) as `Total cities`
FROM superstore ORDER BY  City ;

SELECT City , SUM(Sales) as `Total Sales`
FROM superstore 
GROUP BY  City 
ORDER BY `Total Sales` DESC LIMIT 10 ;

-- MONTH/YEAR SALES 
SELECT YEAR(`Order Date`) AS Year, MONTH(`Order Date`) AS Month, SUM(Sales) AS Total_Sales
FROM superstore 
GROUP BY YEAR(`Order Date`), MONTH(`Order Date`)
ORDER BY Year, Month ;

-- PROFIT ANALYSIS 
SELECT SUM(Sales) as Total_Sales,
 SUM(Profit) as Total_Profit
FROM superstore ;
	
SELECT  Category ,SUM(Sales) as Total_Sales,
 SUM(Profit) as Total_Profit
FROM 
	superstore 
group by Category
ORDER BY  Total_Profit DESC;

SELECT Category, SUM(Sales) AS Total_Sales, SUM(Profit) AS Total_Profit,
(SUM(Profit)/ SUM(Sales))* 100 AS Profit_Margin_Percentage
FROM superstore
GROUP BY Category
ORDER BY Profit_Margin_Percentage DESC;

-- Profit and sales on a quarterly basis
SELECT Quarter (`Order Date`) as Quarter , 
 SUM(Sales) AS Total_Sales, 
 SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY Quarter (`Order Date`)
ORDER BY Quarter DESC ;










