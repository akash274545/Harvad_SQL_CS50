CREATE TABLE IF NOT EXISTS "passengers" (
    "first_name" TEXT,
    "last_name"  TEXT,
    "age"        INTEGER
);

CREATE TABLE IF NOT EXISTS "check_ins" (
    "date" NUMERIC,
    "flight_id" INTEGER,
    FOREIGN KEY ("flight_id") REFERENCES "flights"("id")
);


CREATE TABLE IF NOT EXISTS "airlines" (
    "id"      INTEGER PRIMARY KEY AUTOINCREMENT,
    "name"    TEXT NOT NULL,
    "section" TEXT
);

CREATE TABLE IF NOT EXISTS "flights" (
    "flight_no"      INTEGER PRIMARY KEY AUTOINCREMENT,
    "airline_id"     INTEGER NOT NULL,
    "code_from"      TEXT NOT NULL,
    "code_to"        TEXT NOT NULL,
    "date"           TEXT,  -- Use TEXT for ISO 8601 date format (YYYY-MM-DD)
    "departure_date" TEXT,  -- Store full date-time if needed
    "arrival_date"   TEXT,
    FOREIGN KEY ("airline_id") REFERENCES "airlines"("id") ON DELETE CASCADE
);



