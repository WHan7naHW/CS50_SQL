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
