-- Problem: Article Views
-- Link: https://leetcode.com/problems/article-views-i/?envType=study-plan-v2&envId=top-sql-50
## Approch
-- Find users who viewed their own content:
-- Filter rows where author_id = viewer_id,
-- then use DISTINCT to return unique author_ids as id.


select  distinct author_id  as id from Views 
where author_id=viewer_id
group by id;
