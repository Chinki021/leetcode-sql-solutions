--link : https://leetcode.com/problems/triangle-judgement/?envType=study-plan-v2&envId=top-sql-50
-- A triangle is valid if sum of any two sides > third side

-- Check:
-- x + y > z
-- x + z > y
-- y + z > x

-- If all true → 'Yes', else 'No'

SELECT 
    x, 
    y, 
    z,
    CASE 
        WHEN x + y > z AND x + z > y AND y + z > x 
        THEN 'Yes'
        ELSE 'No'
    END AS triangle
FROM Triangle;
