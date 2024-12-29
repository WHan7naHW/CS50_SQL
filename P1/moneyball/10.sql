/* Detail each player’s name, their salary for each year
they’ve been playing, and their number of home runs for
each year they’ve been playing */
SELECT
    "first_name",
    "last_name",
    "salary",
    "HR",
    "salaries"."year"
FROM
    "performances"
JOIN
    "players"
ON
    "players"."id" = "performances"."player_id"
JOIN
    "salaries"
ON
    "players"."id" = "salaries"."player_id"
WHERE
    "salaries"."year" = "performances"."year"
ORDER BY
    "players"."id",
    "salaries"."year" DESC,
    "HR" DESC,
    "salary" DESC
;
