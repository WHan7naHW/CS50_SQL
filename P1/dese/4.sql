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
