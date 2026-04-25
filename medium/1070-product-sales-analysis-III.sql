--link : https://leetcode.com/problems/product-sales-analysis-iii/?envType=study-plan-v2&envId=top-sql-50
-- Logic:
-- 1. For each product_id, we first determine the earliest year it was sold.
--    This is done using MIN(year) with GROUP BY product_id.

-- 2. This gives us a mapping:
--    product_id -> first_year

-- 3. Then, we join this result back with the original Sales table
--    to fetch all rows where:
--       - product_id matches
--       - year = first_year

-- 4. This ensures that if a product has multiple sales in its first year,
--    all of them are included.



SELECT 
    s.product_id,
    s.year AS first_year,
    s.quantity,
    s.price
FROM Sales s
JOIN (
    SELECT 
        product_id, 
        MIN(year) AS first_year
    FROM Sales
    GROUP BY product_id
) f
ON s.product_id = f.product_id 
AND s.year = f.first_year;
