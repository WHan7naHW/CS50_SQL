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
