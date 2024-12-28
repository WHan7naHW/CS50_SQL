/* return all normal ocean temperatures at 50m of depth,
as well as their respective degrees of latitude and
longitude, within the Arabian Sea */

SELECT "50m", "latitude", "longitude"
FROM normals
WHERE ("latitude" BETWEEN 0 AND 20)
AND ("longitude" BETWEEN 55 AND 75);
