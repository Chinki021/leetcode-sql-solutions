--link : https://leetcode.com/problems/monthly-transactions-i/?envType=study-plan-v2&envId=top-sql-50
-- Logic:
-- 1. Extract month using TO_CHAR(trans_date, 'YYYY-MM') (PostgreSQL alternative to DATE_FORMAT).
--
-- 2. Group by month and country.
--
-- 3. COUNT(*) → total transactions.
--
-- 4. SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END)
--    → counts approved transactions.
--
-- 5. SUM(amount) → total transaction amount.
--
-- 6. SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END)
--    → total approved transaction amount.

SELECT 
    TO_CHAR(trans_date, 'YYYY-MM') AS month,
    country,
    
    COUNT(*) AS trans_count,
    
    SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) AS approved_count,
    
    SUM(amount) AS trans_total_amount,
    
    SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount

FROM Transactions
GROUP BY month, country;
