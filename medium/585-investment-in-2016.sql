--link : https://leetcode.com/problems/investments-in-2016/?envType=study-plan-v2&envId=top-sql-50
--# 💡 Approach

--Select policyholders who meet both conditions:

-- `tiv_2015` appears more than once (duplicate investment)  
-- `(lat, lon)` is unique (no shared location)  

--Then sum their `tiv_2016` and round to 2 decimal places.
  
SELECT ROUND(SUM(tiv_2016)::numeric, 2) AS tiv_2016
FROM Insurance
WHERE tiv_2015 IN (
    SELECT tiv_2015
    FROM Insurance
    GROUP BY tiv_2015
    HAVING COUNT(*) > 1
)
AND (lat, lon) IN (
    SELECT lat, lon
    FROM Insurance
    GROUP BY lat, lon
    HAVING COUNT(*) = 1
);
