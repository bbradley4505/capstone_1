SELECT *
FROM sample_sales. store_sales
LIMIT 10;

SELECT
SUM(sale_amount) AS Total_revenue,
MIN(Transaction_Date) AS start_date,
MAX(Transaction_date) AS End_date
FROM Sample_sales. store_sales
JOIN sample_sales.store_locations
ON store_id = storeid
WHERE state= 'Florida' ;
-- #1 overall total revenue: 3,930,187.55, start date: 12/31/2021, end date: 12/30/2025

SELECT
YEAR(Transaction_Date) AS Year,
MONTH(Transaction_Date) AS Month,
SUM(Sale_Amount) AS Revenue
FROM sample_sales.store_sales
JOIN sample_sales.store_locations
ON store_id = storeId
WHERE state = 'Florida'
GROUP BY Year,Month
ORDER BY Year, Month;
-- #2 

SELECT
State,
SUM(Sale_Amount) AS Total_Revenue
FROM sample_sales.store_sales
JOIN sample_sales.store_locations
ON store_id = StoreId
WHERE State IN ('Florida','Texas','South Carolina')
GROUP BY State;

SELECT
SUM(Sale_Amount) AS South_Revenue
FROM sample_sales.store_sales
JOIN sample_sales.store_locations
ON store_id = StoreId
WHERE State IN ('Florida','Texas','South Carolina') ;
--- #3 Florida (3,930,187.55), South Carolina (648,812.56), Texas (3417850.01) Total South Revenue: 7996850.12

SELECT*
FROM sample_sales.products
LIMIT 10;

SELECT
YEAR(transaction_date) AS Year,
MONTH(transaction_date) AS Month,
categoryid,
COUNT(*) AS Transactions,
AVG(Sale_Amount) AS Average
FROM sample_sales.store_sales
JOIN sample_sales.store_locations
ON store_ID = StoreId
JOIN sample_sales.products
ON prod_num = ProdNum
WHERE State = 'Florida'
GROUP BY Year, Month, Categoryid; 
---#4

SELECT
StoreLocation,
SUM(Sale_Amount) AS Total_Revenue
FROM sample_sales.store_sales
JOIN sample_sales.store_locations
ON Store_ID = StoreId
WHERE State = 'Florida'
GROUP BY StoreId, StoreLocation
ORDER BY Total_Revenue DESC;
---#5

#6 Next quarter reccomendation:
I reccomend focusing on Naples and Lakeland next quarter 
because they generated the lowest total revenue in Florida. 
Naples generated $259,602.83, while lakeland generated $273,835.24.
Miami had the highest revenue at $618,846.25. I would reccomend 
studying Miami's sales performance to identify strategies that
could help improve sales in Naples and Lakeland. 
