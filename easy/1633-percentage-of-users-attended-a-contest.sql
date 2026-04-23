--link : https://leetcode.com/problems/percentage-of-users-attended-a-contest/?envType=study-plan-v2&envId=top-sql-50
-- Count users per contest and divide by total users to get percentage
-- Cast to numeric to avoid integer division and multiply by 100
-- Round to 2 decimal places
-- Group by contest_id and sort by percentage DESC, contest_id ASC


SELECT 
    r.contest_id,
    ROUND(
        COUNT(r.user_id)::numeric * 100 / (SELECT COUNT(*) FROM Users),
        2
    ) AS percentage
FROM Register r
GROUP BY r.contest_id
ORDER BY percentage DESC, r.contest_id ASC;
