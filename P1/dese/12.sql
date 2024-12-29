/* Find public school districts with above-average
per-pupil expenditures and an above-average
percentage of teachers rated “exemplary”.  */
SELECT
    "d"."name",
    "e"."per_pupil_expenditure",
    "s"."exemplary"
FROM
    "districts" AS "d"
JOIN
    "expenditures" AS "e"
ON
    "e"."district_id" = "d"."id"
JOIN
    "staff_evaluations" AS "s"
ON
    "s"."district_id" = "d"."id"
WHERE
    "d"."type" = 'Public School District'
AND
    "e"."per_pupil_expenditure" > (
        SELECT AVG("per_pupil_expenditure")
        FROM "expenditures"
    )
AND
    "s"."exemplary" > (
        SELECT AVG("exemplary")
        FROM "staff_evaluations"
    )
ORDER BY
    "s"."exemplary" DESC,
    "e"."per_pupil_expenditure" DESC
;
