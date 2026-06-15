CREATE DATABASE superstore_project;
SHOW DATABASES;
USE superstore_project;

SELECT *  FROM orders;

SELECT Country FROM orders;

SELECT Sales ,`Product Name`FROM orders;

SELECT DISTINCT Country FROM orders;

SELECT * FROM orders
WHERE Sales>1000;

SELECT * FROM orders
WHERE category='Furniture';

SELECT * FROM orders
WHERE 'Order Date' BETWEEN '2014-01-01' AND '2015-01-01';

SELECT SUM(sales) AS Total_Sales FROM orders;

SELECT SUM(Profit) AS Total_Profit FROM orders;

SELECT MIN(Profit) AS Min_Profit,
       MAX(Profit) AS Max_Profit,
       AVG(Profit) AS Avg_Profit
FROM orders;

SELECT `Order ID`,`Product Name`,Sales
FROM orders
ORDER BY Sales DESC 
LIMIT 10;

SHOW COLUMNS FROM orders;

SELECT `Product Name`, Sales FROM orders LIMIT 10;

SELECT `Product Name`,SUM(Sales) AS Total_Sales 
FROM orders GROUP BY `Product Name`
			ORDER BY Total_Sales DESC
            LIMIT 10;

ALTER TABLE orders RENAME COLUMN `ï»¿Order ID`
To Order_ID;

SELECT City ,
		SUM(Sales) AS Total_Sales
FROM Orders
GROUP BY City
ORDER BY Total_Sales DESC;

SELECT * FROM Orders 
WHERE City='Madison';

SELECT Category,
		ROUND(SUM(Sales),2) AS Total_Sales
FROM orders
GROUP BY Category
ORDER BY Total_Sales DESC;

SELECT Category,
		SUM(Profit) AS Total_Profit
FROM orders
GROUP BY Category
ORDER BY Total_Profit DESC;

SELECT Region,
		SUM(Profit) AS Total_Profit
FROM orders
GROUP BY Region
ORDER BY Total_Profit DESC;

SELECT `Sub-Category`,
		SUM(Profit) AS Total_Profit
FROM orders
GROUP BY `Sub-Category`
ORDER BY Total_Profit ASC
LIMIT 10;

SELECT 
	ROUND(AVG(Discount),2) AS
Avg_Discount,
	ROUND(AVG(Profit),2) AS
Avg_Profit
From Orders;

SELECT `Customer Name`,
	Sum(Sales) AS Total_Sales
FROM Orders
GROUP BY `Customer Name`
ORDER BY Total_Sales DESC
LIMIT 10;

SELECT `Product Name`,
	Sum(Sales) AS Total_Sales
FROM Orders
GROUP BY `Product Name`
ORDER BY Total_Sales DESC
LIMIT 10;

SELECT YEAR(`Order Date`) AS
Order_Year,
	SUM(Sales) AS Total_Sales
FROM Orders
GROUP BY YEAR(`Order Date`)
ORDER BY Order_Year;

SELECT `Order Date`
FROM Orders
LIMIT 5;

SELECT `Order Date`,
	STR_TO_DATE(`Order Date`,'%d-%m-%Y') AS Test_Date
FROM Orders
LIMIT 10;

SELECT 
	YEAR(Test_Date) AS Order_Year,
    SUM(Sales) AS Total_Sales
    FROM(SELECT STR_TO_DATE(`Order Date`,'%d-%m-%Y')
    AS Test_Date,Sales
    FROM Orders)t
GROUP BY YEAR(Test_Date)
ORDER BY Order_Year;    
   
SELECT 
	YEAR(STR_TO_DATE(`Order Date`,'%d,%m,%y'))
    AS Order_Year,
    SUM(Sales) AS Total_Sales
FROM Orders
GROUP BY YEAR(STR_TO_DATE(`Order Date`,'%d,%m,%y'))
ORDER BY Order_Year;