/* Choose a location of your own and find the normal temperature
at 0 meters, 100 meters, and 200 meters.
Norwegian Sea: 69°01'27"N 2°04'30"E */

SELECT "0m", "100m", "200m" FROM normals
WHERE "latitude" = 69.5
AND "longitude" = 2.5;
