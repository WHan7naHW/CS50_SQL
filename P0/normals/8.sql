/* Find the 10 locations with the lowest
normal ocean surface temperature, sorted
coldest to warmest. */

SELECT "latitude", "longitude", "0m"
FROM normals
ORDER BY "0m", "latitude"
LIMIT 10;
