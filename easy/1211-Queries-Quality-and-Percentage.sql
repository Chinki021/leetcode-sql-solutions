--link : https://leetcode.com/problems/queries-quality-and-percentage/?envType=study-plan-v2&envId=top-sql-50
-- Logic:
-- 1. Group the data by query_name since we need results per query.
--
-- 2. Query Quality:
--    - Defined as the average of (rating / position).
--    - Use AVG(rating * 1.0 / position) to avoid integer division.
--
-- 3. Poor Query Percentage:
--    - A query is considered poor if rating < 3.
--    - Use CASE WHEN rating < 3 THEN 1 ELSE 0 END to mark poor queries.
--    - Sum these values to count poor queries.
--    - Divide by total queries (COUNT(*)) and multiply by 100 to get percentage.
--
-- 4. ROUND(..., 2) is used to format both results to 2 decimal places as required.
--
-- 5. Final result returns:
--    - query_name
--    - quality
--    - poor_query_percentage




SELECT 
    query_name,
    
    ROUND(AVG(rating * 1.0 / position), 2) AS quality,
    
    ROUND(
        SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) * 100.0 
        / COUNT(*), 
    2) AS poor_query_percentage

FROM Queries
GROUP BY query_name;
