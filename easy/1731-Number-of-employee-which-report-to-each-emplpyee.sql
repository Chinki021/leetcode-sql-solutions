--link : https://leetcode.com/problems/the-number-of-employees-which-report-to-each-employee/?envType=study-plan-v2&envId=top-sql-50
-- Self-join Employees table:
-- e1 = manager, e2 = employees reporting to them

-- Join on: e1.employee_id = e2.reports_to

-- COUNT(e2.employee_id) → number of direct reports
-- AVG(e2.age) → average age of reports (rounded)

-- GROUP BY manager to get one row per manager

-- INNER JOIN ensures only managers with at least one report are included


SELECT 
    e1.employee_id,
    e1.name,
    COUNT(e2.employee_id) AS reports_count,
    ROUND(AVG(e2.age)) AS average_age
FROM Employees e1
JOIN Employees e2
    ON e1.employee_id = e2.reports_to
GROUP BY e1.employee_id, e1.name
ORDER BY e1.employee_id;
