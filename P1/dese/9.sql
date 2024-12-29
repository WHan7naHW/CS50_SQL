-- Find the name (or names) of the school district(s) with the single least number of pupils
SELECT
    "d"."name"
FROM
    "districts" AS "d"
JOIN
    "expenditures" AS "e"
ON
    "e"."district_id" = "d"."id"
WHERE
    "e"."pupils" = (
        SELECT MIN("pupils")
        FROM "expenditures"
    )
;
