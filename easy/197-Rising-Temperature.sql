-- Problem: Rising Temperature
--link : https://leetcode.com/problems/rising-temperature/description/?envType=study-plan-v2&envId=top-sql-50
-- Find ids where today's temperature > yesterday's temperature

select w1.id
from Weather w1
join Weather w2
on DATEDIFF(w1.recordDate,w2.recordDate)=1
where w1.temperature>w2.temperature;
