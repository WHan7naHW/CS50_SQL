/* Find the titles of episodes that have aired during the holiday season,
usually in December in the United States.

SELECT "title" FROM "episodes"
WHERE "air_date" LIKE '_____12___'; */

-- Try to find a better solution than LIKE if you can

SELECT "title"
FROM "episodes"
WHERE STRFTIME('%m', "air_date") = '12';
