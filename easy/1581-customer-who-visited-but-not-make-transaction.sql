--problem : 1581-customer-who-visited-but-not-make-transaction
--link : https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/?envType=study-plan-v2&envId=top-sql-50
--level : easy

SELECT customer_id , count(*) as count_no_trans
from Visits v 
left join Transactions t
on v.visit_id=t.visit_id
where transaction_id is null
group by customer_id;
