--link : https://leetcode.com/problems/not-boring-movies/?envType=study-plan-v2&envId=top-sql-50
-- 🔍 Approach:
-- 1. We need to filter movies based on two conditions:
--    • The movie ID should be odd → (id % 2 = 1)
--    • The description should NOT be 'boring'
--
-- 2. After filtering, we sort the remaining records
--    in descending order of rating so that the highest-rated
--    movies appear first.
--
-- 3. We use:
--    • WHERE clause → to apply filtering conditions
--    • ORDER BY DESC → to sort results by rating (highest to lowest)
--
-- ✅ Final Result:
-- Returns all non-boring movies with odd IDs,
-- ordered by rating in decreasing order.



SELECT *
FROM Cinema
WHERE id % 2 = 1
  AND description != 'boring'
ORDER BY rating DESC;
