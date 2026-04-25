--link : https://leetcode.com/problems/game-play-analysis-iv/?envType=study-plan-v2&envId=top-sql-50

-- Logic:
-- 1. Find each player's first login date:
--    - Use MIN(event_date) grouped by player_id.
--
-- 2. Check if the player logged in again the next day:
--    - Join Activity table on:
--      a.event_date = first_date + INTERVAL '1 day'
--
-- 3. Count players who returned the next day:
--    - COUNT(DISTINCT a.player_id)
--
-- 4. Count total players:
--    - COUNT(DISTINCT f.player_id)
--
-- 5. Compute fraction:
--    - returned_players / total_players
--
-- 6. Use ROUND(..., 2) for final output.

WITH first_login AS (
    SELECT 
        player_id,
        MIN(event_date) AS first_date
    FROM Activity
    GROUP BY player_id
)

SELECT 
    ROUND(
        COUNT(DISTINCT a.player_id) * 1.0 
        / COUNT(DISTINCT f.player_id),
    2) AS fraction
FROM first_login f
LEFT JOIN Activity a
    ON f.player_id = a.player_id
    AND a.event_date = f.first_date + INTERVAL '1 day';
