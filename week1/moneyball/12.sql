SELECT players.first_name, players.last_name
FROM players
JOIN salaries ON players.id = salaries.player_id
JOIN performances ON players.id = performances.player_id
    AND salaries.year = performances.year
WHERE performances.year = 2001
AND performances.H > 0
AND performances.RBI > 0
AND salaries.salary > 0
AND players.id IN (
    -- Get players in the 10 least expensive per hit
    SELECT salaries.player_id
    FROM salaries
    JOIN performances ON salaries.player_id = performances.player_id
    WHERE salaries.year = 2001
    AND performances.year = 2001
    AND performances.H > 0
    ORDER BY (salaries.salary / performances.H) ASC
    LIMIT 10
)
AND players.id IN (
    -- Get players in the 10 least expensive per RBI
    SELECT salaries.player_id
    FROM salaries
    JOIN performances ON salaries.player_id = performances.player_id
    WHERE salaries.year = 2001
    AND performances.year = 2001
    AND performances.RBI > 0
    ORDER BY (salaries.salary / performances.RBI) ASC
    LIMIT 10
)
ORDER BY players.id ASC;
