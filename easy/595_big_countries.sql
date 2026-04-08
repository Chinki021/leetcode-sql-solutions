-- Problem: Big Countries
-- Link:https://leetcode.com/problems/big-countries/?envType=study-plan-v2&envId=top-sql-50
-- Approach: Using WHERE condition with OR to filter large area or population

select name , population , area from World
where area>=3000000 or population>=25000000;
