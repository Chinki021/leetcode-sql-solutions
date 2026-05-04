--link : https://leetcode.com/problems/find-users-with-valid-e-mails/?envType=study-plan-v2&envId=top-sql-50

-- Use regex (~ in PostgreSQL) to filter valid emails:
-- Must start with a letter, allow letters/digits/._- in prefix,
-- and end with '@leetcode.com'

SELECT *
FROM Users
WHERE mail ~ '^[A-Za-z][A-Za-z0-9._-]*@leetcode\.com$';
