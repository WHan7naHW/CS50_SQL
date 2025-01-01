-- Find the average player salary by year
SELECT
    "year",
    ROUND(AVG("salary"), 2) AS "average salary"
FROM
    "salaries"
GROUP BY
    "year"
ORDER BY
    "year" DESC
;


-- Find Cal Ripken Jr.’s salary history
SELECT
    "year",
    "salary"
FROM
    "salaries"
WHERE "player_id" = (
    SELECT "id"
    FROM "players"
    WHERE "first_name" = 'Cal'
    AND "last_name" = 'Ripken'
)
ORDER BY
    "year" DESC
;


-- Find Ken Griffey Jr.’s home run history
SELECT
    "year",
    "HR"
FROM
    "performances"
WHERE "player_id" = (
    SELECT "id"
    FROM "players"
    WHERE
        "first_name" = 'Ken'
    AND
        "last_name" = 'Griffey'
    AND
        "birth_year" = '1969'

)
ORDER BY
    "year" DESC
;


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


-- Find all teams that Satchel Paige played for
SELECT
    "name"
FROM
    "teams"
JOIN
    "performances"
ON
    "performances"."team_id" = "teams"."id"
WHERE "player_id" = (
    SELECT "id"
    FROM "players"
    WHERE "first_name" = 'Satchel'
    AND "last_name" = 'Paige'
);


-- Return the top 5 teams, sorted by the total number of hits by players in 2001
SELECT
    "name",
    SUM("H") AS "total hits"
FROM
    "performances"
JOIN
    "teams"
    ON "teams"."id" = "performances"."team_id"
WHERE
    "performances"."year" = 2001
GROUP BY
    "performances"."team_id"
ORDER BY
    "total hits" DESC
LIMIT 5;


-- Find the name of the player who’s been paid the highest salary
SELECT
    "first_name",
    "last_name"
FROM
    "players"
JOIN
    "salaries"
    ON "salaries"."player_id" = "players"."id"
WHERE "salary" = (
    SELECT MAX("salary")
    FROM "salaries"
);


-- Find the 2001 salary of the player who hit the most home runs in 2001
SELECT
    "salary"
FROM
    "salaries"
WHERE "player_id" = (
    SELECT "player_id"
    FROM "performances"
    WHERE "year" = '2001'
    ORDER BY "HR" DESC
    LIMIT 1
)
AND
    "year" = '2001'
;


-- Find the 5 lowest paying teams (by average salary) in 2001
SELECT
    "name",
    ROUND(AVG("salary"), 2) AS "average salary"
FROM
    "teams"
JOIN
    "salaries"
ON
    "salaries"."team_id" = "teams"."id"
WHERE
    "salaries"."year" = '2001'
GROUP BY
    "salaries"."team_id"
ORDER BY
    "average salary" 
LIMIT 5;


-- Find the 5 lowest paying teams (by average salary) in 2001
SELECT
    "name",
    ROUND(AVG("salary"), 2) AS "average salary"
FROM
    "teams"
JOIN
    "salaries"
ON
    "salaries"."team_id" = "teams"."id"
WHERE
    "salaries"."year" = '2001'
GROUP BY
    "salaries"."team_id"
ORDER BY
    "average salary" 
LIMIT 5;


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


/* Find the players among the 10 least expensive players
per hit and among the 10 least expensive players per RBI
in 2001. */
SELECT
    "first_name",
    "last_name"
FROM
    "players"
WHERE
    "id" IN (
        SELECT "p"."player_id"
        FROM "performances" AS "p"
        JOIN "salaries" AS "s"
            ON "p"."player_id" = "s"."player_id"
        WHERE
            "H" != 0
            AND "s"."year" = 2001
            AND "p"."year" = 2001
        ORDER BY "salary" / "H"
        LIMIT 10
    )
    AND "id" IN (
        SELECT "p"."player_id"
        FROM "performances" AS "p"
        JOIN "salaries" AS "s"
        ON "p"."player_id" = "s"."player_id"
        WHERE
            "RBI" != 0
            AND "s"."year" = 2001
            AND "p"."year" = 2001
        ORDER BY "salary" / "RBI"
        LIMIT 10
    )
ORDER BY "id";
