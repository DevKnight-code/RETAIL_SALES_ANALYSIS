SELECT * FROM
RETAILSALES


--- data cleaning---
SELECT 
    COUNT(*) 
FROM RETAILSALES

SELECT * FROM
RETAILSALES
WHERE  
    transactions_id IS NULL
    OR
    sale_date IS NULL
    OR 
    sale_time IS NULL
    OR
    gender IS NULL
    OR
    category IS NULL
    OR
    quantity IS NULL
    OR
    cogs IS NULL
    OR
    total_sale IS NULL;

DELETE FROM RETAILSALES
WHERE 
    transactions_id IS NULL
    OR
    sale_date IS NULL
    OR 
    sale_time IS NULL
    OR
    gender IS NULL
    OR
    category IS NULL
    OR
    quantity IS NULL
    OR
    cogs IS NULL
    OR
    total_sale IS NULL;

 SELECT 
 COUNT(*) 
FROM RETAILSALES


---- DATA EXPLORATION-----
--HOW MANY SALES WE HAVE--
SELECT COUNT(*) as total_sale
FROM RETAILSALES

--- NO OF CUSTOMERS--
SELECT COUNT(DISTINCT customer_id) as customers
FROM RETAILSALES

-- NO OF CATEGORIES--
SELECT COUNT(DISTINCT category) as categories
FROM RETAILSALES

SELECT DISTINCT category 
FROM RETAILSALES


----- DATA ANALYSIS AND BUSINESS KEY PROBLEMS----
            -- SALES PERFORMANCE----
  ----------- MONTHLY REVENUE REPORT ------
SELECT
YEAR(sale_date) AS Year,
MONTH(sale_date) AS Month,
SUM(total_sale) AS Sales
FROM RETAILSALES
GROUP BY YEAR(sale_date),MONTH(sale_date)
ORDER BY Year,Month;

-------YEARLY SALES
SELECT
YEAR(sale_date) Year,
SUM(total_sale) Sales
FROM RETAILSALES
GROUP BY YEAR(sale_date);

---- REVENUE CONTRIBUTION BY EACH CATEGORY----
SELECT
    category,
    SUM(total_sale) AS Sales,
    CAST(
        ROUND(
            100.0 * SUM(total_sale) /
            SUM(SUM(total_sale)) OVER(),
            2
        ) AS DECIMAL(10,2)
    ) AS Contribution
FROM RETAILSALES
GROUP BY category;

--- REVENUE BY CATEGORY---
SELECT
    category,
    CAST(SUM(total_sale) AS DECIMAL(12,2)) AS Revenue
FROM RETAILSALES
GROUP BY category
ORDER BY Revenue DESC;

---Revenue by Category with Number of Orders--
SELECT
    category,
    COUNT(*) AS Total_Orders,
    CAST(SUM(total_sale) AS DECIMAL(12,2)) AS Revenue
FROM RETAILSALES
GROUP BY category
ORDER BY Revenue DESC;

--- CUSTOMER ANALYSIS--
-- TOP CUSTOMER BY REVENUE--
SELECT TOP (5)
    customer_id,
    COUNT(transactions_id) AS Total_Orders,
    SUM(quantity) AS Total_Quantity,
    CAST(SUM(total_sale) AS DECIMAL(12,2)) AS Total_Revenue
FROM RETAILSALES
GROUP BY customer_id
ORDER BY Total_Revenue DESC;

---Top Customers with Average Order Value--
SELECT TOP (10)
    customer_id,
    COUNT(transactions_id) AS Orders,
    SUM(quantity) AS Quantity_Purchased,
    CAST(SUM(total_sale) AS DECIMAL(12,2)) AS Revenue,
    CAST(AVG(total_sale) AS DECIMAL(10,2)) AS Avg_Order_Value
FROM RETAILSALES
GROUP BY customer_id
ORDER BY Revenue DESC;

---REPEAT CUSTOMERS-- 
SELECT
customer_id,
COUNT(*) Orders
FROM RETAILSALES
GROUP BY customer_id
HAVING COUNT(*)>1;

--AVERAGE PURCHASE VALUE-- 
SELECT
AVG(total_sale) AvgPurchase
FROM RETAILSALES;

--AGE GROUP ANALYSIS--
SELECT
CASE
WHEN age<20 THEN 'Teen'
WHEN age BETWEEN 20 AND 35 THEN 'Young'
WHEN age BETWEEN 36 AND 50 THEN 'Adult'
ELSE 'Senior'
END AgeGroup,
SUM(total_sale) Sales
FROM RETAILSALES
GROUP BY
CASE
WHEN age<20 THEN 'Teen'
WHEN age BETWEEN 20 AND 35 THEN 'Young'
WHEN age BETWEEN 36 AND 50 THEN 'Adult'
ELSE 'Senior'
END;

-------PRODUCT ANALYSIS -------
-------HIGHEST QUANTITY SOLD BY CATEGORY-------
SELECT
    category,
    SUM(quantity) AS Total_Quantity_Sold
FROM RETAILSALES
GROUP BY category
ORDER BY Total_Quantity_Sold DESC;

--- HIGHEST QUANTITY SOLD PRODUCT----
SELECT TOP 1
    category,
    SUM(quantity) AS Total_Quantity_Sold
FROM RETAILSALES
GROUP BY category
ORDER BY Total_Quantity_Sold DESC;

-- LOWEST SALES CATEGORY--
SELECT TOP 1
    category,
    SUM(total_sale) AS Total_Sales
FROM RETAILSALES
GROUP BY category
ORDER BY Total_Sales ASC;


--- HIGHEST SALES CATEGORY--
SELECT TOP 1
    category,
    SUM(total_sale) AS Total_Sales
FROM RETAILSALES
GROUP BY category
ORDER BY Total_Sales DESC;

--- AVERAGE SELLING PRICE BY CATEGORY---
SELECT
    category,
    CAST(AVG(price_per_unit) AS DECIMAL(10,2)) AS Avg_Selling_Price
FROM RETAILSALES
GROUP BY category
ORDER BY Avg_Selling_Price DESC;

---OVERALL AVERAGE SELLING PRICE---
SELECT
    CAST(AVG(price_per_unit) AS DECIMAL(10,2)) AS Overall_Average_Selling_Price
FROM RETAILSALES;

---Highest revenue transaction:---
SELECT TOP 10
    transactions_id,
    customer_id,
    category,
    quantity,
    total_sale
FROM RETAILSALES
ORDER BY total_sale DESC;

--- profitability analysis---
SELECT
CAST(SUM(total_sale-cogs) AS DECIMAL(12,2)) AS  Profit
FROM RETAILSALES;

---Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
  SELECT * FROM RETAILSALES
WHERE sale_date = '2022-11-05';

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022
SELECT * FROM RETAILSALES
WHERE category = 'Clothing'
  AND quantity >= 4
  AND sale_date BETWEEN '2022-11-01' AND '2022-11-30';


-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
 SELECT category,
 SUM(total_sale) as totalsale,
 COUNT(*) as total_orders
 FROM RETAILSALES
 GROUP BY category
 ORDER BY  category

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
     SELECT 
     AVG(age) as average_age
     FROM RETAILSALES
     WHERE category = 'Beauty'
     
-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
  SELECT * FROM RETAILSALES
  WHERE total_sale > 1000

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
   SELECT 
      gender,
      category,
      COUNT(*) as total_transactions
    FROM RETAILSALES
      GROUP BY  gender,category
      ORDER BY gender,category

-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
WITH MonthlySales AS
(
    SELECT
        YEAR(sale_date) AS sale_year,
        MONTH(sale_date) AS sale_month,
        AVG(total_sale) AS average_sale,
        SUM(total_sale) AS total_sales
    FROM RETAILSALES
    GROUP BY YEAR(sale_date), MONTH(sale_date)
),

RANKEDSALE AS 
(
    SELECT *,
           RANK() OVER(PARTITION BY sale_year
                       ORDER BY average_sale DESC) AS rn
    FROM MonthlySales
)
SELECT sale_year,
       sale_month,
       average_sale
FROM RANKEDSALE
WHERE rn = 1;

-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
    SELECT TOP(5)
     customer_id,
     SUM(total_sale) as highest_sale
    FROM RETAILSALES
    GROUP BY customer_id
    ORDER BY highest_sale DESC
     

-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
  SELECT 
  category,
  COUNT (DISTINCT customer_id) as unique_customers
  FROM RETAILSALES
  GROUP BY category


-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)
WITH hourly_sale AS
(
   SELECT
    CASE
        WHEN DATEPART(HOUR, sale_time) < 12 THEN 'Morning'
        WHEN DATEPART(HOUR, sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS Shift
   
FROM RETAILSALES
)
SELECT Shift,
      COUNT(*) as total_orders
FROM hourly_sale
GROUP BY Shift

----OR--- 
SELECT
    CASE
        WHEN DATEPART(HOUR, sale_time) < 12 THEN 'Morning'
        WHEN DATEPART(HOUR, sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS Shift,
    COUNT(transaction_id) AS number_of_orders
FROM RETAILSALES
GROUP BY
    CASE
        WHEN DATEPART(HOUR, sale_time) < 12 THEN 'Morning'
        WHEN DATEPART(HOUR, sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END;


