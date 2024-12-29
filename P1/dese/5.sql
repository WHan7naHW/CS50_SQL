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
