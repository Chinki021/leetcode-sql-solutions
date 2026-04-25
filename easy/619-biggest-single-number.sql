--link : https://leetcode.com/problems/biggest-single-number/?envType=study-plan-v2&envId=top-sql-50

-- Logic:
-- 1. First, group the table by 'num' to count how many times each number appears.

-- 2. Use HAVING COUNT(*) = 1 to filter only those numbers
--    that appear exactly once (i.e., "single numbers").

-- 3. This gives us a list of all unique numbers.

-- 4. From this list, we use MAX(num) to get the largest one.

-- 5. If no such number exists, MAX() automatically returns NULL.


SELECT 
    MAX(num) AS num
FROM (
    SELECT num
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(*) = 1
) AS single_numbers;
