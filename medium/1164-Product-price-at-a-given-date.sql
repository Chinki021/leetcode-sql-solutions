--link : https://leetcode.com/problems/product-price-at-a-given-date/?envType=study-plan-v2&envId=top-sql-50
-- Each product initially has a price of 10.
-- For a given date (2019-08-16), we need the latest price update
-- that happened on or before this date.

-- Approach:
-- 1. For each product_id, check all records where change_date <= '2019-08-16'.
-- 2. From those, pick the most recent one (latest change_date).
-- 3. If no such record exists, return the default price = 10.

-- This works because the price on any date depends on the
-- last update before or on that date.




SELECT 
    p.product_id,
    COALESCE(
        (
            SELECT new_price
            FROM Products p2
            WHERE p2.product_id = p.product_id
              AND p2.change_date <= '2019-08-16'
            ORDER BY p2.change_date DESC
            LIMIT 1
        ),
        10
    ) AS price
FROM 
    (SELECT DISTINCT product_id FROM Products) p;
