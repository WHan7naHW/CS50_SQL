-- Create a view that contains all listings and the number
-- of days in June of 2023 that they remained vacant
CREATE VIEW "june_vacancies" AS
SELECT
    "listings"."id",
    "property_type",
    "host_name",
    COUNT("*") AS "days_vacant"
FROM
    "listings"
JOIN
    "availabilities" ON "availabilities"."listing_id" = "listings"."id"
WHERE
    "date" LIKE '2023-06%'
    AND "available" = 'TRUE'
GROUP BY
    "listings"."id"
;
