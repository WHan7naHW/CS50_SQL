-- Find the 50 players paid the least in 2001
SELECT
    "first_name",
    "last_name",
    "salary"
FROM
    "salaries"
JOIN
    "players"
    ON "players"."id" = "salaries"."player_id"
WHERE
    "salaries"."year" = 2001
ORDER BY
    "salary",
    "first_name",
    "last_name",
    "players"."id"
LIMIT 50;
