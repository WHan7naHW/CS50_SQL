
-- *** The Lost Letter ***
SELECT * FROM "addresses"
-- Find the end address
WHERE "id" = (
    -- Find "id" from "packages" where "contents" include 'congratulatory'
    SELECT "to_address_id" FROM "packages"
    WHERE "contents" LIKE '%congratulatory%'
    AND "from_address_id" = (
        -- Find the address_id of '900 Somerville Avenue' from "addresses"
        SELECT "id" FROM "addresses"
        WHERE "address" = '900 Somerville Avenue'
        )
    )
;


-- *** The Devious Delivery ***
SELECT
    -- Find "content" from "packages"
    p.contents,
    -- Find "type" from "addresses"
    a.type
FROM
    packages AS p
JOIN
    scans AS s ON p.id = s.package_id
JOIN
    addresses AS a ON a.id = s.address_id
WHERE
    -- Filter "id" from "packages" without "from" address
    p.from_address_id IS NULL
AND
    -- Filter "action" from "scans" is 'Drop'
    s.action = 'Drop';


-- *** The Forgotten Gift ***
SELECT
    -- Find "contents" from table "packages"
    p.contents AS contents,
    -- Find "name" from table "drivers"
    d.name AS name,
    s.action,
    -- Find latest action
    MAX(s.timestamp) AS latest_timestamp
FROM
    packages AS p
JOIN
    scans AS s ON s.package_id = p.id
JOIN
    drivers AS d ON d.id = s.driver_id
WHERE
    -- Track "package_id" from "packages"
    s.package_id = (
        SELECT "id" FROM "packages"
        WHERE "from_address_id" = (
            -- Find "id" from "addresses" of '109 Tileston Street'
            SELECT "id" FROM "addresses"
            WHERE "address" = '109 Tileston Street'
        )
    )
;
