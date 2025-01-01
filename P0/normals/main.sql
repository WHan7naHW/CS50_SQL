/* Find the normal ocean surface temperature in the Gulf of Maine,
off the coast of Massachusetts.
To find this temperature, look at the data associated with 42.5° of
latitude and -69.5° of longitude.*/
SELECT "0m" FROM normals WHERE "latitude" = 42.5 AND "longitude" = -69.5;


-- Find the normal temperature of the deepest sensor near the Gulf of Maine
SELECT "225m" FROM normals WHERE "latitude" = 42.5 AND "longitude" = -69.5;


/* Choose a location of your own and find the normal temperature
at 0 meters, 100 meters, and 200 meters.
Norwegian Sea: 69°01'27"N 2°04'30"E */
SELECT "0m", "100m", "200m" FROM normals
WHERE "latitude" = 69.5
AND "longitude" = 2.5;


-- Find the lowest normal ocean surface temperature
SELECT MIN("0m") FROM normals;


-- Find the highest normal ocean surface temperature
SELECT MAX("0m") FROM normals;


/* return all normal ocean temperatures at 50m of depth,
as well as their respective degrees of latitude and
longitude, within the Arabian Sea */
SELECT "50m", "latitude", "longitude"
FROM normals
WHERE ("latitude" BETWEEN 0 AND 20)
AND ("longitude" BETWEEN 55 AND 75);


/* find the average ocean surface temperature,
rounded to two decimal places, along the equator.
Call the resulting column “Average Equator Ocean
Surface Temperature”. */
SELECT ROUND(AVG("0m"), 2)
AS "Average Equator Ocean Surface Temperature"
FROM normals
WHERE ("latitude" BETWEEN -0.5 AND 0.5);


/* Find the 10 locations with the lowest
normal ocean surface temperature, sorted
coldest to warmest. */
SELECT "latitude", "longitude", "0m"
FROM normals
ORDER BY "0m", "latitude"
LIMIT 10;


/* Find the 10 locations with the lowest
normal ocean surface temperature, sorted
coldest to warmest. */
SELECT "latitude", "longitude", "0m"
FROM normals
ORDER BY "0m", "latitude"
LIMIT 10;


/* determine how many points of latitude
we have at least one data point for.  */
SELECT COUNT(DISTINCT "latitude")
FROM normals;
