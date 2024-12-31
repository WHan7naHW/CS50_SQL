-- Create a view to contain all census records relating to a rural municipality
CREATE VIEW "rural" AS
SELECT * FROM "census"
WHERE "locality" LIKE '%Rural%';
