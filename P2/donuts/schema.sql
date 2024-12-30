
-- Donuts
CREATE TABLE IF NOT EXISTS "donuts" (
    "id" INTEGER PRIMARY KEY,
    "name" VARCHAR(100) NOT NULL,
    "gluten_free" BOOLEAN NOT NULL,
    "price" DECIMAL(5, 2) NOT NULL
);


-- Ingredients
CREATE TABLE IF NOT EXISTS "ingredients" (
    "id" INTEGER PRIMARY KEY,
    "ingredient" VARCHAR(100) NOT NULL,
    "price" DECIMAL(5, 2) NOT NULL,
    "donut_id" INTEGER NOT NULL,
    FOREIGN KEY ("donut_id") REFERENCES "donuts"("id")
        ON DELETE CASCADE
);


-- Customers
CREATE TABLE IF NOT EXISTS "customers" (
    "id" INTEGER PRIMARY KEY,
    "first_name" VARCHAR(100) NOT NULL,
    "last_name" VARCHAR(100) NOT NULL
);


-- Orders
CREATE TABLE IF NOT EXISTS "orders" (
    "id" INTEGER PRIMARY KEY,
    "order_number" VARCHAR(20) UNIQUE NOT NULL,
    "customer_id" INTEGER NOT NULL,
    FOREIGN KEY ("customer_id") REFERENCES "customers"("id")
        ON DELETE CASCADE
);


-- Connections for orders and donuts
CREATE TABLE IF NOT EXISTS "order_items" (
    "id" INTEGER PRIMARY KEY,
    "order_id" INTEGER NOT NULL,
    "donut_id" INTEGER NOT NULL,
    "donut_quantity" INTEGER NOT NULL CHECK (donut_quantity > 0),
    FOREIGN KEY ("order_id") REFERENCES "orders"("id")
        ON DELETE CASCADE,
    FOREIGN KEY ("donut_id") REFERENCES "donuts"("id")
        ON DELETE CASCADE
);
