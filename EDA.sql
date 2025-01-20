CREATE TABLE SalesData (
    Region VARCHAR(100),
    Country VARCHAR(100),
    ItemType VARCHAR(50),
    SalesChannel VARCHAR(20),
    OrderPriority CHAR(1),
    OrderDate DATE,
    OrderID BIGINT,
    ShipDate DATE,
    UnitsSold INT,
    UnitPrice FLOAT,
    UnitCost FLOAT,
    TotalRevenue FLOAT,
    TotalCost FLOAT,
    TotalProfit FLOAT
);

--INSERTING DATA

COPY SalesData
FROM 'C:\Users\ayush\Desktop\sales_5000000.csv'
DELIMITER ',' 
CSV HEADER;


--Total Sales by Region:
SELECT Region, SUM(TotalRevenue) AS TotalSales
FROM SalesData
GROUP BY Region;

--Profit Analysis by Item Type:
SELECT ItemType, SUM(TotalProfit) AS TotalProfit
FROM SalesData
GROUP BY ItemType
ORDER BY TotalProfit DESC;

--Monthly Sales Trend:
SELECT TO_CHAR(OrderDate, 'YYYY-MM') AS Month, SUM(TotalRevenue) AS MonthlySales
FROM SalesData
GROUP BY TO_CHAR(OrderDate, 'YYYY-MM')
ORDER BY Month;


--Top 5 Countries by Sales:
SELECT Country, SUM(TotalRevenue) AS TotalSales
FROM SalesData
GROUP BY Country
ORDER BY TotalSales DESC
LIMIT 5;
