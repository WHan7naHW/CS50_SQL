-- Create a view to contain all census records relating to a rural municipality
CREATE VIEW "rural" AS
SELECT * FROM "census"
WHERE "locality" LIKE '%Rural%';


-- Create a view to contain the sums for each numeric
-- column in census, across all districts and localities
CREATE VIEW "total" AS
SELECT
    SUM("families") AS "families",
    SUM("households") AS "households",
    SUM("population") AS "population",
    SUM("male") AS "male",
    SUM("female") AS "female"
FROM "census";


-- Create a view to contain the sums for each
-- numeric column in census, grouped by district
CREATE VIEW "by_district" AS
SELECT
    "district",
    SUM("families") AS "families",
    SUM("households") AS "households",
    SUM("population") AS "population",
    SUM("male") AS "male",
    SUM("female") AS "female"
FROM "census"
GROUP BY "district";


-- Create a view to contain, in order from greatest
-- to least, the most populated districts in Nepal
CREATE VIEW "most_populated" AS
SELECT
    "district",
    SUM("families") AS "families",
    SUM("households") AS "households",
    SUM("population") AS "population",
    SUM("male") AS "male",
    SUM("female") AS "female"
FROM "census"
GROUP BY "district"
ORDER BY "population" DESC;
