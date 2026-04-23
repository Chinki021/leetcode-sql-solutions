--link : https://leetcode.com/problems/average-selling-price/?envType=study-plan-v2&envId=top-sql-50

--logic♨️

-- Compute weighted average price: SUM(units * price) / SUM(units)
-- Join on product_id and valid date range to get correct price
-- Cast to numeric (::numeric) to avoid integer division in PostgreSQL
-- Use COALESCE to handle products with no sales (return 0)
-- Round result to 2 decimal places

SELECT 
    p.product_id,
    ROUND(
        COALESCE(
            SUM(u.units * p.price)::numeric / SUM(u.units),
            0
        ),
        2
    ) AS average_price
FROM Prices p
LEFT JOIN UnitsSold u
    ON p.product_id = u.product_id
   AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY p.product_id;
