-- Find the hometown (including city, state, and country) of Jackie Robinson
SELECT "birth_city", "birth_state", "birth_country"
FROM "players"
WHERE "first_name" = 'Jackie'
AND "last_name" = 'Robinson';


-- Find the side (e.g., right or left) Babe Ruth hit
SELECT "bats" FROM "players"
WHERE "first_name" = 'Babe'
AND "last_name" = 'Ruth';


-- Find the ids of rows for which a value in the column debut is missing
SELECT "id" FROM "players"
WHERE "debut" IS NULL;


-- Find the first and last names of players who were not born in the United States.
SELECT "first_name", "last_name"
FROM "players"
WHERE "birth_country" NOT LIKE 'USA'
ORDER BY "first_name", "last_name";


-- Return the first and last names of all right-handed batters.
SELECT "first_name", "last_name"
FROM "players"
WHERE "bats" = 'R'
ORDER BY "first_name", "last_name";


-- Return the first name, last name, and debut date of players born in Pittsburgh, Pennsylvania (PA).
SELECT "first_name", "last_name", "debut"
FROM "players"
WHERE "birth_city" = 'Pittsburgh'
AND "birth_state" = 'PA'
ORDER BY "debut" DESC, "first_name", "last_name";


/* count the number of players who bat (or batted)
right-handed and throw (or threw) left-handed, or
vice versa. */
SELECT COUNT("id")
FROM "players"
WHERE ("bats" = 'R' AND "throws" = 'L')
OR ("bats" = 'L' AND "throws" = 'R');


/* find the average height and weight, rounded to
two decimal places, of baseball players who debuted
on or after January 1st, 2000. Return the columns
with the name “Average Height” and “Average Weight”,
respectively. */
SELECT
    ROUND(AVG("height"), 2) AS "Average Height",
    ROUND(AVG("weight"), 2) AS "Average Weight"
FROM
    "players"
WHERE
    "debut" >= '2000-1-1'
;


-- Find the players who played their final game in the MLB in 2022
SELECT "first_name", "last_name"
FROM "players"
WHERE SUBSTR("final_game", 1, 4) = '2022'
ORDER BY "first_name", "last_name";


/* List the first and last names of all players of
above average height, sorted tallest to shortest,
then by first and last name. */
SELECT "first_name", "last_name"
FROM "players"
WHERE "height" > (SELECT AVG("height") FROM "players")
ORDER BY "height" DESC, "first_name", "last_name";
