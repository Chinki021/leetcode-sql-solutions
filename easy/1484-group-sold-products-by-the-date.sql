--link : https://leetcode.com/problems/group-sold-products-by-the-date/?envType=study-plan-v2&envId=top-sql-50
--Group records by sell_date.

--For each date:
-- Use COUNT(DISTINCT product) to count unique products.
-- Use GROUP_CONCAT(DISTINCT product) to combine product names.
-- Sort product names lexicographically using ORDER BY inside GROUP_CONCAT.

--Finally, order the result by sell_date.



SELECT 
    sell_date,
    COUNT(DISTINCT product) AS num_sold,
    STRING_AGG(DISTINCT product, ',' ORDER BY product) AS products
FROM Activities
GROUP BY sell_date
ORDER BY sell_date;
