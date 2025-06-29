CREATE TABLE IF NOT EXISTS "ingredients" (
    "id"             INTEGER PRIMARY KEY AUTOINCREMENT,
    "name"           TEXT NOT NULL,
    "price_per_unit" REAL NOT NULL
);

CREATE TABLE IF NOT EXISTS "donuts" (
    "id"              INTEGER PRIMARY KEY AUTOINCREMENT,
    "name"            TEXT NOT NULL,
    "ingredient_id"   INTEGER,
    "is_gluten_free"  INTEGER CHECK ("is_gluten_free" IN (0, 1)), -- 0 for false, 1 for true
    "price_per_donut" REAL NOT NULL,
    FOREIGN KEY ("ingredient_id") REFERENCES "ingredients" ("id")
);

CREATE TABLE IF NOT EXISTS "customers" (
    "id"         INTEGER PRIMARY KEY AUTOINCREMENT,
    "first_name" TEXT NOT NULL,
    "last_name"  TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS "orders" (
    "id"           INTEGER PRIMARY KEY AUTOINCREMENT,
    "order_number" TEXT NOT NULL,
    "customer_id"  INTEGER,
    FOREIGN KEY ("customer_id") REFERENCES "customers" ("id")
);

CREATE TABLE IF NOT EXISTS "donuts_orders" (
    "id"          INTEGER PRIMARY KEY AUTOINCREMENT,
    "order_id"    INTEGER NOT NULL,
    "customer_id" INTEGER NOT NULL,
    FOREIGN KEY ("order_id") REFERENCES "orders" ("id"),
    FOREIGN KEY ("customer_id") REFERENCES "customers" ("id")
);

CREATE TABLE IF NOT EXISTS "customer_order_history" (
    "customer_id" INTEGER,
    "order_id"    INTEGER,
    PRIMARY KEY ("customer_id", "order_id"),
    FOREIGN KEY ("customer_id") REFERENCES "customers" ("id"),
    FOREIGN KEY ("order_id")    REFERENCES "orders" ("id")
);
