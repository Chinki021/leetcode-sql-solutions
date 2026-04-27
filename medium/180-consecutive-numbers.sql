--link : https://leetcode.com/problems/consecutive-numbers/?envType=study-plan-v2&envId=top-sql-50
-- Use LAG to look at previous rows:
-- prev1 → previous row (id - 1)
-- prev2 → two rows before (id - 2)

-- For each row, compare:
-- current num == prev1 == prev2

-- If all three are equal → it means
-- the number appears 3 times consecutively

-- DISTINCT ensures each number appears only once in output


SELECT DISTINCT num AS ConsecutiveNums
FROM (
    SELECT 
        num,
        LAG(num,1) OVER (ORDER BY id) AS prev1,
        LAG(num,2) OVER (ORDER BY id) AS prev2
    FROM Logs
) t
WHERE num = prev1 AND num = prev2;
