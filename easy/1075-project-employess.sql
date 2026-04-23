--link : https://leetcode.com/problems/project-employees-i/?envType=study-plan-v2&envId=top-sql-50
-- 🔍 Approach:
-- Join Project and Employee tables using employee_id
-- to get experience_years for each employee in a project
--
-- Calculate average experience using AVG(experience_years)
-- for each project
--
-- Cast result to numeric (::numeric) to ensure decimal precision
-- and use ROUND(..., 2) to format output to 2 decimal places
--
-- Group by project_id to compute result per project



SELECT 
    p.project_id,
    ROUND(AVG(e.experience_years)::numeric, 2) AS average_years
FROM Project p
JOIN Employee e
    ON p.employee_id = e.employee_id
GROUP BY p.project_id;
