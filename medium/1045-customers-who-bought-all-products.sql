--link : https://leetcode.com/problems/customers-who-bought-all-products/?envType=study-plan-v2&envId=top-sql-50


-- Logic:
-- 1. First, determine the total number of unique products available
--    using COUNT(*) from the Product table.

-- 2. Then, group the Customer table by customer_id
--    to analyze each customer's purchases.

-- 3. For each customer, count DISTINCT product_key
--    because the table may contain duplicate rows.

-- 4. If a customer's distinct product count equals the total number of products,
--    it means they bought every product.

-- 5. Return those customer_ids.

SELECT 
    customer_id
FROM Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (
    SELECT COUNT(*) FROM Product
);
