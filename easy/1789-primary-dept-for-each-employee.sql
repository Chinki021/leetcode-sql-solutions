--link : https://leetcode.com/problems/primary-department-for-each-employee/?envType=study-plan-v2&envId=top-sql-50
-- Case 1: Select primary department (primary_flag = 'Y')

-- Case 2: If employee has only one department (COUNT = 1),
-- use MAX(department_id) to safely select it

-- UNION combines both results

SELECT employee_id, department_id
FROM Employee
WHERE primary_flag = 'Y'

UNION

SELECT employee_id, MAX(department_id) AS department_id
FROM Employee
GROUP BY employee_id
HAVING COUNT(*) = 1;
