-- Problem: Invalid Tweets
-- Link: https://leetcode.com/problems/invalid-tweets/?envType=study-plan-v2&envId=top-sql-50
-- Approach: Filter tweets where content length is greater than 15


select tweet_id from Tweets
where length(content)>15;
