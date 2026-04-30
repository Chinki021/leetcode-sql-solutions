--link : https://leetcode.com/problems/friend-requests-ii-who-has-the-most-friends/?envType=study-plan-v2&envId=top-sql-50

-- 💡 Approach

--Friendship is **bidirectional**, so both requester and accepter are counted.

-- Combine both sides of the relationship  
-- Count total occurrences for each user  
-- The user with the highest count has the most friends  

-- 🔁 Follow-up

--If multiple users have the same maximum, return all users whose friend count equals the maximum.

SELECT id, COUNT(*) AS num
FROM (
    SELECT requester_id AS id FROM RequestAccepted
    UNION ALL
    SELECT accepter_id AS id FROM RequestAccepted
) t
GROUP BY id
ORDER BY num DESC
LIMIT 1;
