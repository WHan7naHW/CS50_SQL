-- List the titles of all episodes in Cyberchase’s original season, Season 1
SELECT title FROM episodes WHERE season = 1;


-- List the season number of, and title of, the first episode of every season
SELECT season, title FROM episodes WHERE episode_in_season = 1;


-- Find the production code for the episode “Hackerized!”
SELECT production_code FROM episodes WHERE title = 'Hackerized!';


-- Find the titles of episodes that do not yet have a listed topic
SELECT DISTINCT title FROM episodes WHERE topic IS NULL;


-- Find the title of the holiday episode that aired on December 31st, 2004
SELECT title FROM episodes WHERE air_date = '2004-12-31';


-- List the titles of episodes from season 6 (2008) that were released early, in 2007
SELECT title FROM episodes WHERE season = 6 AND air_date < '2008-01-01';


-- List the titles and topics of all episodes teaching fractions
SELECT "title", "topic" FROM "episodes" WHERE "topic" LIKE '%fractions%';


-- Count the number of episodes released in the last 6 years, from 2018 to 2023, inclusive
SELECT COUNT("episode_in_season") FROM "episodes"
WHERE "air_date" BETWEEN '2018-01-01'
    AND '2023-12-31';


-- Count the number of episodes released in Cyberchase’s first 6 years, from 2002 to 2007, inclusive
SELECT COUNT("episode_in_season") FROM episodes
WHERE "air_date" BETWEEN '2002-01-01' AND '2007-12-31';


-- List the ids, titles, and production codes of all episodes.
-- Order the results by production code, from earliest to latest
SELECT "id", "title", "production_code"
FROM "episodes"
ORDER BY "production_code";


-- List the titles of episodes from season 5, in reverse alphabetical order
SELECT "title" FROM "episodes"
WHERE "season" = 5
ORDER BY "title" DESC;


-- Count the number of unique episode titles
SELECT COUNT(DISTINCT "title") FROM "episodes";


/* Find the titles of episodes that have aired during the holiday season,
usually in December in the United States.
SELECT "title" FROM "episodes"
WHERE "air_date" LIKE '_____12___'; */
-- Try to find a better solution than LIKE if you can
SELECT "title"
FROM "episodes"
WHERE STRFTIME('%m', "air_date") = '12';

