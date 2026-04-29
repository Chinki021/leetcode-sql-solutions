--link : https://leetcode.com/problems/employees-whose-manager-left-the-company/?envType=study-plan-v2&envId=top-sql-50
-- Logic:
-- 1. We need employees whose salary is less than 30000.
-- 2. Among them, find employees whose manager has left the company.
-- 3. A manager is considered "left" if their manager_id does not exist
--    in the employee_id column of the Employees table.
-- 4. Use LEFT JOIN to match each employee with their manager.
-- 5. If no match is found (m.employee_id IS NULL), it means the manager is missing.
-- 6. Exclude employees with NULL manager_id (they don't have a manager).
-- 7. Finally, return the employee_id in ascending order.



SELECT employee_id
FROM Employees
WHERE salary < 30000
  AND manager_id IS NOT NULL
  AND manager_id NOT IN (
      SELECT employee_id FROM Employees
  )
ORDER BY employee_id;
