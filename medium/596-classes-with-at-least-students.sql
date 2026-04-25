--link : https://leetcode.com/problems/classes-with-at-least-5-students/?envType=study-plan-v2&envId=top-sql-50

-- Problem: Find classes that have at least 5 students

-- Logic:
-- 1. Group the data by 'class' so that we can analyze each class separately.

-- 2. For each class, count the number of students using COUNT(student).

-- 3. Use HAVING (not WHERE) because we are filtering based on an aggregate function.

-- 4. Only keep those classes where the number of students is greater than or equal to 5.


SELECT 
    class
FROM Courses
GROUP BY class
HAVING COUNT(student) >= 5;
