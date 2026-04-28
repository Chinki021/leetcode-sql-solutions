--link : https://leetcode.com/problems/last-person-to-fit-in-the-bus/?envType=study-plan-v2&envId=top-sql-50
-- The idea is to simulate people boarding the bus in order of their turn.

-- 1. Use a window function to calculate the running total (cumulative sum)
--    of weights ordered by 'turn'.
-- 2. This gives the total weight after each person boards.
-- 3. Filter only those rows where total_weight <= 1000 (valid boarding).
-- 4. From these, pick the last person (maximum total_weight).

-- This works because boarding happens sequentially,
-- so once the limit is exceeded, no further people can board.




SELECT person_name
FROM (
    SELECT 
        person_name,
        SUM(weight) OVER (ORDER BY turn) AS total_weight
    FROM Queue
) t
WHERE total_weight <= 1000
ORDER BY total_weight DESC
LIMIT 1;
