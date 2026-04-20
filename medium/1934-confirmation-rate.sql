-- Problem: Confirmation Rate of Each User

--link : https://leetcode.com/problems/confirmation-rate/?envType=study-plan-v2&envId=top-sql-50

-- Approach: LEFT JOIN + Conditional Aggregation + NULL handling
-- Logic:
-- 1. Use LEFT JOIN to include all users (even those with no confirmations)
-- 2. Count total requests using COUNT(c.user_id)
-- 3. Count confirmed requests using SUM(CASE WHEN action = 'confirmed')
-- 4. Avoid division by zero using NULLIF(COUNT(...), 0)
-- 5. Use COALESCE to return 0 when result is NULL
-- 6. Cast to decimal to prevent integer division
-- 7. Round result to 2 decimal places

SELECT 
    s.user_id,
    ROUND(
        COALESCE(
            SUM(CASE WHEN c.action = 'confirmed' THEN 1 ELSE 0 END)::decimal
            / NULLIF(COUNT(c.user_id), 0),
        0),
    2) AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c
ON s.user_id = c.user_id
GROUP BY s.user_id;
