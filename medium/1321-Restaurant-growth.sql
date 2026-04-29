--link : https://leetcode.com/problems/restaurant-growth/?envType=study-plan-v2&envId=top-sql-50
-- Logic:
-- 1. Aggregate total amount per day using GROUP BY visited_on
-- 2. Use window function to calculate 7-day rolling sum:
--    SUM(amount) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)
-- 3. Compute average by dividing rolling sum by 7
-- 4. Round to 2 decimal places
-- 5. Skip first 6 rows since a full 7-day window is not available



WITH daily AS (
    SELECT 
        visited_on,
        SUM(amount) AS amount
    FROM Customer
    GROUP BY visited_on
)

SELECT 
    visited_on,
    SUM(amount) OVER (
        ORDER BY visited_on 
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS amount,
    ROUND(
        SUM(amount) OVER (
            ORDER BY visited_on 
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) / 7, 2
    ) AS average_amount
FROM daily
ORDER BY visited_on
OFFSET 6;
