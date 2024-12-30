-- Passengers
CREATE TABLE IF NOT EXISTS "passengers" (
    "id" SERIAL PRIMARY KEY,
    "first_name" VARCHAR(50),
    "last_name" VARCHAR(50),
    "age" INTEGER
);


-- Airlines
CREATE TABLE IF NOT EXISTS "airlines" (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(50) NOT NULL,
    "concourse" VARCHAR(1) NOT NULL
);


-- Flights
CREATE TABLE IF NOT EXISTS "flights" (
    "id" SERIAL PRIMARY KEY,
    "number" INTEGER NOT NULL,
    "airline_id" INTEGER REFERENCES "airlines"("id"),
    "from_airport_code" VARCHAR(3) NOT NULL,
    "to_airport_code" VARCHAR(3) NOT NULL,
    "departure_datetime" DATETIME NOT NULL,
    "arrival_datetime" DATETIME NOT NULL
);


-- Check-Ins
CREATE TABLE IF NOT EXISTS "check-ins" (
    "id" SERIAL PRIMARY KEY,
    "datetime" DATETIME NOT NULL,
    "flight_id" INTEGER NOT NULL,
    FOREIGN KEY ("flight_id") REFERENCES "flights"("id")
);
