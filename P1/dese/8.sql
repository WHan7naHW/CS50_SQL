-- Display the names of all school districts and the number of pupils enrolled in each
SELECT
    "d"."name",
    "e"."pupils"
FROM
    "districts" AS "d"
JOIN
    "expenditures" AS "e"
ON
    "e"."district_id" = "d"."id"
;
