-- Problem: 584. Customer Not Referred
--link : https://leetcode.com/problems/find-customer-referee/description/?envType=study-plan-v2&envId=top-sql-50
-- Difficulty: Easy

SELECT name from customer
where referee_id!=2 OR referee_id is null;
