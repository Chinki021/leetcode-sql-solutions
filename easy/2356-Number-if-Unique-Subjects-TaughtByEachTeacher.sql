--link : https://leetcode.com/problems/number-of-unique-subjects-taught-by-each-teacher/?envType=study-plan-v2&envId=top-sql-50
-- Logic:
-- 1. Group records by teacher_id since we need results per teacher.
--
-- 2. A teacher may teach the same subject in multiple departments,
--    but we only count unique subjects.
--
-- 3. Use COUNT(DISTINCT subject_id) to count unique subjects per teacher.
--
-- 4. Return teacher_id and the count as cnt.

SELECT 
    teacher_id,
    COUNT(DISTINCT subject_id) AS cnt
FROM Teacher
GROUP BY teacher_id;
