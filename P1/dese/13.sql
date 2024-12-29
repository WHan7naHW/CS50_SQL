-- List 10 districts with highest teacher proficient
SELECT
    "d"."name",
    "s"."proficient"
FROM
    "districts" AS "d"
JOIN
    "staff_evaluations" AS "s"
ON
    "s"."district_id" = "d"."id"
ORDER BY
    "s"."proficient" DESC,
    "d"."name"
LIMIT 10;
