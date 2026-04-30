--link : https://leetcode.com/problems/department-top-three-salaries/?envType=study-plan-v2&envId=top-sql-50

--Find employees whose salary is in the **top 3 unique salaries per department**.
-- Rank salaries within each department (highest first)  
-- Use DENSE_RANK to handle duplicate salaries  
-- Select employees with rank ≤ 3  
  
SELECT d.name AS Department,
       e.name AS Employee,
       e.salary AS Salary
FROM (
    SELECT *,
           DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) AS rnk
    FROM Employee
) e
JOIN Department d
ON e.departmentId = d.id
WHERE e.rnk <= 3;
