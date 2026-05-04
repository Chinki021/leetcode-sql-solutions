--link : https://leetcode.com/problems/list-the-products-ordered-in-a-period/?envType=study-plan-v2&envId=top-sql-50
-- Filter February 2020 orders, group by product_id, sum units,
-- keep only totals >= 100 using HAVING, and join with Products
-- to get the product_name.

SELECT 
    p.product_name,
    SUM(o.unit) AS unit
FROM Orders o
JOIN Products p
    ON o.product_id = p.product_id
WHERE o.order_date >= '2020-02-01'
  AND o.order_date < '2020-03-01'
GROUP BY p.product_id, p.product_name
HAVING SUM(o.unit) >= 100;
