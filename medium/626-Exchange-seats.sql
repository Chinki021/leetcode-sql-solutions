--link : https://leetcode.com/problems/exchange-seats/?envType=study-plan-v2&envId=top-sql-50
-- Logic:
-- Swap every pair of consecutive seat ids.
-- 1. If id is odd → swap with next id (id + 1)
-- 2. If id is even → swap with previous id (id - 1)
-- 3. If it's the last row and odd → keep it unchanged
-- 4. Use CASE to reassign ids and ORDER BY id for correct sequence

SELECT 
    CASE 
        WHEN id % 2 = 1 AND id = (SELECT MAX(id) FROM Seat) THEN id
        WHEN id % 2 = 1 THEN id + 1
        ELSE id - 1
    END AS id,
    student
FROM Seat
ORDER BY id;
