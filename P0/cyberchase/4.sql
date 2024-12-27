-- Find the titles of episodes that do not yet have a listed topic

SELECT DISTINCT title FROM episodes WHERE topic IS NULL;
