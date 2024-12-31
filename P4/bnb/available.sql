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
