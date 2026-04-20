--link : https://leetcode.com/problems/managers-with-at-least-5-direct-reports/?envType=study-plan-v2&envId=top-sql-50
-- Approach:
-- Use self join to map employees with their managers (e.id = emp.managerId)
-- Group by manager and count number of direct reports
-- Filter using HAVING COUNT >= 5 to get required managers


select name
from Employee
where id in(
    select managerId
    from Employee
    group by managerId
    having count(*)>=5
);
