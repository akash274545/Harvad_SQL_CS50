-- Import CSV file
.mode csv
.import meteorites.csv temp

-- Set empty values to NULL
UPDATE temp
SET mass = NULL
WHERE mass = '' OR mass IS NULL;

UPDATE temp
SET year = NULL
WHERE year = '' OR year IS NULL;

UPDATE temp
SET lat = NULL
WHERE lat = '' OR lat IS NULL;

UPDATE temp
SET long = NULL
WHERE long = '' OR long IS NULL;

-- Round certain columns to two decimal places
UPDATE temp
SET
    mass = ROUND(COALESCE(mass, 0), 2),
    lat = ROUND(COALESCE(lat, 0), 2),
    long = ROUND(COALESCE(long, 0), 2);

-- Convert NULL values back after rounding (since 0 was used)
UPDATE temp
SET mass = NULL WHERE mass = 0;

UPDATE temp
SET lat = NULL WHERE lat = 0;

UPDATE temp
SET long = NULL WHERE long = 0;

-- Delete rows with nametype 'Relict'
DELETE FROM temp
WHERE nametype = 'Relict';

DROP TABLE IF EXISTS meteorites;

CREATE TABLE meteorites AS
SELECT
    ROW_NUMBER() OVER (ORDER BY COALESCE(year, 9999), name) AS id,
    name,
    class,
    mass,
    discovery,
    year,
    lat,
    long
FROM temp;

DROP TABLE temp;


