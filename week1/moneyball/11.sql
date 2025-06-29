SELECT
    players.first_name,
    players.last_name,
    CAST(ROUND(salaries.salary / NULLIF(performances.H, 0), 0) AS INTEGER) AS dollars_per_hit
FROM
    players
JOIN salaries
    ON players.id = salaries.player_id
JOIN performances
    ON players.id = performances.player_id
    AND salaries.year = performances.year
WHERE
    salaries.year = 2001
    AND performances.year = 2001
    AND performances.H > 0
ORDER BY
    dollars_per_hit ASC
LIMIT
    10;
