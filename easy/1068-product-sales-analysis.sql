-- 🧩 Problem: Product Sales Analysis
-- 🔗 Link: https://leetcode.com/problems/product-sales-analysis-i/?envType=study-plan-v2&envId=top-sql-50
-- 🏷️ Difficulty: Easy

-- 💡 Approach:
-- Join Sales and Product table using product_id
-- Select product_name, year, and price



select product_name , year , price 
from Sales s
join product p
on s.product_id=p.product_id;
