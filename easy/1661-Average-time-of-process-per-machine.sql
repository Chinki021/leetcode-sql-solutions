-- 🔹 Problem: Average Time of Process per Machine
-- We are given a table 'Activity' that records when a process starts and ends on a machine.
-- Each (machine_id, process_id) has exactly one 'start' and one 'end'.

-- 🔹 Goal:
-- For each machine, calculate the average time taken to complete its processes.
-- Time for a process = end_time - start_time
-- Return machine_id and average processing_time (rounded to 3 decimal places).

-- 🔹 Approach:
-- 1. Use SELF JOIN to pair 'start' and 'end' rows for same machine_id and process_id.
-- 2. Filter such that:
--      a.activity_type = 'start'
--      b.activity_type = 'end'
-- 3. Compute time difference:
--      b.timestamp - a.timestamp
-- 4. Take average of these differences for each machine using AVG()
-- 5. Use ROUND(..., 3) to get result up to 3 decimal places
-- 6. Since PostgreSQL AVG returns double precision, cast to numeric before ROUND

--link : https://leetcode.com/problems/average-time-of-process-per-machine/?envType=study-plan-v2&envId=top-sql-50

--solution

SELECT 
    a.machine_id,
    ROUND(AVG(b.timestamp - a.timestamp)::numeric, 3) AS processing_time
FROM Activity a
JOIN Activity b
    ON a.machine_id = b.machine_id
    AND a.process_id = b.process_id
    AND a.activity_type = 'start'
    AND b.activity_type = 'end'
GROUP BY a.machine_id;
