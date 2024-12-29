-- Find the first and last names of players who were not born in the United States.

SELECT "first_name", "last_name"
FROM "players"
WHERE "birth_country" NOT LIKE 'USA'
ORDER BY "first_name", "last_name";
