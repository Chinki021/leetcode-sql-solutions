--link : https://leetcode.com/problems/user-activity-for-the-past-30-days-i/?envType=study-plan-v2&envId=top-sql-50
-- Logic:
-- 1. We only care about activities within a fixed 30-day window.
--    So we filter records between '2019-06-28' and '2019-07-27'.

-- 2. A user is considered "active" if they perform at least one activity
--    on a given day (activity_type does not matter).

-- 3. Since a user can perform multiple activities in the same day,
--    we use COUNT(DISTINCT user_id) to avoid duplicate counting.

-- 4. We group by activity_date to calculate active users for each day.

-- 5. Days with no activity are automatically excluded because
--    GROUP BY only returns dates present in the table.




SELECT 
    activity_date AS day,
    COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date BETWEEN '2019-06-28' AND '2019-07-27'
GROUP BY activity_date;
