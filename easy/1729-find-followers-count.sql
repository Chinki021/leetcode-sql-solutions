--link : https://leetcode.com/problems/find-followers-count/?envType=study-plan-v2&envId=top-sql-50

-- Logic:
-- 1. Each row represents a follower-user relationship:
--    follower_id follows user_id.

-- 2. To find total followers of a user, we group by user_id.

-- 3. Then we count follower_id for each group to get the number of followers.

-- 4. Since (user_id, follower_id) is a primary key,
--    there are no duplicate follower relationships, so COUNT() is sufficient.

-- 5. Finally, we sort the result by user_id in ascending order.


SELECT 
    user_id,
    COUNT(follower_id) AS followers_count
FROM Followers
GROUP BY user_id
ORDER BY user_id;
