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