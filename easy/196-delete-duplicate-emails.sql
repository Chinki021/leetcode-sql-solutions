--link : https://leetcode.com/problems/delete-duplicate-emails/?envType=study-plan-v2&envId=top-sql-50
--To remove duplicate emails, we keep only the row with the smallest id for each email and delete the rest.

--We compare the table with itself:
-- For the same email, if one row has a larger id than another, it is considered a duplicate.
-- The row with the larger id is deleted.

--This ensures that for every email, only the record with the minimum id remains in the table.


DELETE FROM Person p1
USING Person p2
WHERE p1.email = p2.email
AND p1.id > p2.id;
