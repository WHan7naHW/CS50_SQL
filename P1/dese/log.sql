-- Find the names and cities of all public schools in Massachusetts
SELECT "name", "city" FROM "schools"
WHERE "type" = 'Public School';


-- Find the names of districts that are no longer operational
SELECT "name" FROM "districts"
WHERE "name" LIKE '%(non-op)';


-- Find the average per-pupil expenditure
SELECT
    AVG("per_pupil_expenditure")
AS
    "Average District Per-Pupil Expenditure"
FROM
    "expenditures"
;


-- Find the 10 cities with the most public schools
SELECT
    "city",
    COUNT(*) AS "number_of_public_schools"
FROM
    "schools"
WHERE
    "type" = 'Public School'
GROUP BY
    "city"
ORDER BY
     "number_of_public_schools" DESC,
     "city"
LIMIT 10;


/* Determine what cities additional public schools
might be needed by finding cities with 3 or fewer
public schools. */
SELECT
    "city",
    COUNT(*) AS "number_of_public_schools"
FROM
    "schools"
WHERE
    "type" = 'Public School'
GROUP BY
    "city"
HAVING
    COUNT(*) <= 3
ORDER BY
    "number_of_public_schools" DESC,
    "city"
;


/* Find the names of schools (public or charter!)
that reported a 100% graduation rate */
SELECT "name" FROM "schools"
WHERE "id" IN (
    SELECT "school_id" FROM "graduation_rates"
    WHERE "graduated" = 100
);


/* Find the names of schools (public or charter!)
that reported a 100% graduation rate */
SELECT "name" FROM "schools"
WHERE "id" IN (
    SELECT "school_id" FROM "graduation_rates"
    WHERE "graduated" = 100
);


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


-- Display the names of schools, their per-pupil expenditure, and their graduation rate
SELECT
    "s"."name",
    "e"."per_pupil_expenditure",
    "g"."graduated"
FROM
    "schools" AS "s"
JOIN
    "expenditures" AS "e"
ON
    "e"."district_id" = "s"."district_id"
JOIN
    "graduation_rates" AS "g"
ON
    "g"."school_id" = "s"."id"
ORDER BY
    "e"."per_pupil_expenditure" DESC,
    "s"."name"
;


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
