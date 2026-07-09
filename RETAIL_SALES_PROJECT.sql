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


