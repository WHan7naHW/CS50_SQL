
-- Users
CREATE TABLE IF NOT EXISTS "users" (
    "id" INTEGER PRIMARY KEY,
    "first_name" VARCHAR(50) NOT NULL,
    "last_name" VARCHAR(50) NOT NULL,
    "username" VARCHAR(150) UNIQUE NOT NULL,
    "password" VARCHAR(255) NOT NULL
);


-- Schools and Universities
CREATE TABLE IF NOT EXISTS "schools" (
    "id" INTEGER PRIMARY KEY,
    "name" VARCHAR(100) NOT NULL,
    "type" VARCHAR(100) NOT NULL,
    "school_location" TEXT,
    "year" INTEGER
);


-- Companies
CREATE TABLE IF NOT EXISTS "companies" (
    "id" INTEGER PRIMARY KEY,
    "name" VARCHAR(100) NOT NULL,
    "industry" VARCHAR(100) NOT NULL,
    "company_location" TEXT
);


-- Connections table for mutual connections
CREATE TABLE IF NOT EXISTS "connections" (
    "user1_id" INTEGER,
    "user2_id" INTEGER,
    "created_at" DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("user1_id", "user2_id"),
    FOREIGN KEY ("user1_id") REFERENCES "users"("id") ON DELETE CASCADE,
    FOREIGN KEY ("user2_id") REFERENCES "users"("id") ON DELETE CASCADE,
    CHECK ("user1_id" != "user2_id")
);


-- Connections table for user-school affiliations
CREATE TABLE IF NOT EXISTS "user_school_affiliations" (
    "user_id" INTEGER,
    "school_id" INTEGER,
    "start_date" DATE,
    "end_date" DATE,
    "degree_type" VARCHAR(50),
    PRIMARY KEY ("user_id", "school_id"),
    FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE,
    FOREIGN KEY ("school_id") REFERENCES "schools"("id") ON DELETE CASCADE
);


-- Connections table for user-company affiliations
CREATE TABLE IF NOT EXISTS "user_company_affiliations" (
    "user_id" INTEGER,
    "company_id" INTEGER,
    "start_date" DATE,
    "end_date" DATE,
    "title" VARCHAR(100),
    PRIMARY KEY ("user_id", "company_id"),
    FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE,
    FOREIGN KEY ("company_id") REFERENCES "companies"("id") ON DELETE CASCADE
);
