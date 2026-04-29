--link : https://leetcode.com/problems/movie-rating/?envType=study-plan-v2&envId=top-sql-50
-- Logic:
-- Part 1:
-- Count total ratings per user using GROUP BY
-- Sort by count DESC and name ASC (for tie-breaking)
-- Pick top 1 user

-- Part 2:
-- Filter ratings from Feb 2020
-- Calculate average rating per movie
-- Sort by avg DESC and title ASC (for tie-breaking)
-- Pick top 1 movie

-- Combine both results using UNION ALL

(
    
    SELECT u.name AS results
    FROM MovieRating mr
    JOIN Users u ON mr.user_id = u.user_id
    GROUP BY u.user_id, u.name
    ORDER BY COUNT(*) DESC, u.name ASC
    LIMIT 1
)

UNION ALL

(
   
    SELECT m.title AS results
    FROM MovieRating mr
    JOIN Movies m ON mr.movie_id = m.movie_id
    WHERE mr.created_at BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY m.movie_id, m.title
    ORDER BY AVG(mr.rating) DESC, m.title ASC
    LIMIT 1
);
