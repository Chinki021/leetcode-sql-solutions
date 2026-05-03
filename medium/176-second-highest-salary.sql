--link : https://leetcode.com/problems/second-highest-salary/?envType=study-plan-v2&envId=top-sql-50

--We first remove duplicate salaries using DISTINCT.
--Then we sort salaries in descending order.
-- The highest salary is at position 0
-- The second highest is at position 1 (OFFSET 1)

--If a second highest salary does not exist, the query returns NULL.


SELECT (
    SELECT DISTINCT salary
    FROM Employee
    ORDER BY salary DESC
    LIMIT 1 OFFSET 1
)
  AS SecondHighestSalary;
