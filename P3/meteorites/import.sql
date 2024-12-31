-- rm meteorites.db


CREATE TABLE IF NOT EXISTS "meteorites_temp" (
    "name" TEXT,
    "id" INTEGER,
    "nametype" TEXT,
    "class" TEXT,
    "mass" REAL,
    "discovery" TEXT,
    "year" REAL,
    "lat" REAL,
    "long" REAL
);


-- cat import.sql | sqlite3 meteorites.db
-- sqlite3 meteorites.db
-- .import --csv --skip 1 meteorites.csv meteorites_temp


UPDATE "meteorites_temp"
SET
    "mass" = CASE WHEN "mass" = '' THEN NULL ELSE ROUND("mass", 2) END,
    "year" = CASE WHEN "year" = '' THEN NULL ELSE ROUND("year") END,
    "lat" = CASE WHEN "lat" = '' THEN NULL ELSE ROUND("lat", 2) END,
    "long" = CASE WHEN "long" = '' THEN NULL ELSE ROUND("long", 2) END
;


DELETE FROM "meteorites_temp"
WHERE "nametype" = 'Relict';


CREATE TABLE IF NOT EXISTS "meteorites" (
    "id" INTEGER PRIMARY KEY,
    "name" TEXT NOT NULL,
    "class" TEXT NOT NULL,
    "mass" NUMERIC,
    "discovery" TEXT NOT NULL,
    "year" NUMERIC,
    "lat" NUMERIC,
    "long" NUMERIC
);


INSERT INTO "meteorites" ("name", "class", "mass", "discovery", "year", "lat", "long")
SELECT "name", "class", "mass", "discovery", "year", "lat", "long"
FROM "meteorites_temp"
ORDER BY "year" ASC, "name" ASC;


DROP TABLE "meteorites_temp";


-- .read import.sql
-- Done!
