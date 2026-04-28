--link : https://leetcode.com/problems/count-salary-categories/?envType=study-plan-v2&envId=top-sql-50

-- We divide accounts into 3 salary categories based on income:
-- 1. Low Salary: income < 20000
-- 2. Average Salary: income between 20000 and 50000 (inclusive)
-- 3. High Salary: income > 50000

-- Approach:
-- - Use separate SELECT queries for each category.
-- - Count the number of accounts in each range.
-- - Combine results using UNION ALL to ensure all categories appear,
--   even if the count is 0.

-- This guarantees exactly 3 rows in output.

SELECT 'Low Salary' AS category, 
       COUNT(*) AS accounts_count
FROM Accounts
WHERE income < 20000

UNION ALL

SELECT 'Average Salary', 
       COUNT(*)
FROM Accounts
WHERE income BETWEEN 20000 AND 50000

UNION ALL

SELECT 'High Salary', 
       COUNT(*)
FROM Accounts
WHERE income > 50000;
