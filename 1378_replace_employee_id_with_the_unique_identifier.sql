-- Problem: Replace Employee ID With The Unique Identifier
-- Link: https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier/?envType=study-plan-v2&envId=top-sql-50

-- Approach:
-- Use LEFT JOIN to include all employees.
-- If an employee does not have a unique_id, it will return NULL automatically.

select  unique_id ,name 
from Employees e 
left join EmployeeUNI un
on e.id=un.id;
