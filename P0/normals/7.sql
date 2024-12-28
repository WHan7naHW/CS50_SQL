/* find the average ocean surface temperature,
rounded to two decimal places, along the equator.
Call the resulting column “Average Equator Ocean
Surface Temperature”. */

SELECT ROUND(AVG("0m"), 2)
AS "Average Equator Ocean Surface Temperature"
FROM normals
WHERE ("latitude" BETWEEN -0.5 AND 0.5);
