--link : https://leetcode.com/problems/immediate-food-delivery-ii/description/?envType=study-plan-v2&envId=top-sql-50
-- Logic:
-- 1. Identify the first order for each customer:
--    - Use ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date)
--    - Assign rank 1 to the earliest order per customer.
--
-- 2. Filter only first orders (rn = 1).
--
-- 3. Immediate orders:
--    - order_date = customer_pref_delivery_date → immediate
--    - Use CASE WHEN ... THEN 1 ELSE 0 END
--
-- 4. Calculate percentage:
--    - (number of immediate first orders / total first orders) * 100
--
-- 5. Use ROUND(..., 2) to format result to 2 decimal places.

WITH first_orders AS (
    SELECT *
    FROM (
        SELECT *,
               ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date) AS rn
        FROM Delivery
    ) t
    WHERE rn = 1
)

SELECT 
    ROUND(
        SUM(CASE 
                WHEN order_date = customer_pref_delivery_date THEN 1 
                ELSE 0 
            END) * 100.0 
        / COUNT(*),
    2) AS immediate_percentage
FROM first_orders;
