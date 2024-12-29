-- Find the 10 public school districts with the highest per-pupil expenditures.
SELECT
    "d"."name",
    "e"."per_pupil_expenditure"
FROM
    "districts" AS "d"
JOIN
    "expenditures" AS "e"
ON
    "e"."district_id" = "d"."id"
WHERE
    "d"."type" = 'Public School District'
ORDER BY
    "e"."per_pupil_expenditure" DESC
LIMIT 10
;
