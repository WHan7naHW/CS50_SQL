-- Create a view that includes all of the columns
-- in the listings table except for description
CREATE VIEW "no_descriptions" AS
SELECT
    "id",
    "property_type",
    "host_name"
    "accommodates",
    "bedrooms"
FROM
    "listings";


-- Create a view that contains all listings that have exactly one bedroom
CREATE VIEW "one_bedrooms" AS
SELECT
    "id",
    "property_type",
    "host_name",
    "accommodates"
FROM
    "listings"
WHERE
    "bedrooms" = 1;


-- Create a view that contains all dates that are available at all listings
CREATE VIEW "available" AS
SELECT
    "listings"."id",
    "property_type",
    "host_name",
    "date"
FROM
    "listings"
JOIN
    "availabilities" ON "availabilities"."listing_id" = "listings"."id"
WHERE
    "available" = 'TRUE';


-- Create a view that contains the 100 most frequently reviewed listings
CREATE VIEW "frequently_reviewed" AS
SELECT
    "listings"."id",
    "property_type",
    "host_name",
    COUNT("comments") AS "reviews"
FROM
    "listings"
JOIN
    "reviews" ON "reviews"."listing_id" = "listings"."id"
GROUP BY
    "reviews"."listing_id"
ORDER BY
    COUNT("comments") DESC,
    "property_type",
    "host_name"
LIMIT 100;


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
