-- Find the 10 least expensive players per hit in 2001
SELECT
    "first_name",
    "last_name",
    "salary" / "H" AS "dollars per hit"
FROM
    "performances"
JOIN
    "players"
    ON "players"."id" = "performances"."player_id"
JOIN
    "salaries"
    ON "players"."id" = "salaries"."player_id"
WHERE
    "H" != 0
    AND "salaries"."year" = 2001
    AND "performances"."year" = 2001
ORDER BY
    "dollars per hit",
    "first_name",
    "last_name"
LIMIT 10;
