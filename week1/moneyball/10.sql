SELECT
    players.first_name,
    players.last_name,
    salaries.salary,
    performances.HR,
    salaries.year
FROM
    players
JOIN salaries
    ON players.id = salaries.player_id
JOIN performances
    ON players.id = performances.player_id
    AND salaries.year = performances.year  -- Ensuring same year in both tables
ORDER BY
    players.id ASC,         -- Sort by player ID (ensures grouping)
    salaries.year DESC,     -- Sort by year (latest first)
    performances.HR DESC,   -- Highest home runs first
    salaries.salary DESC;   -- Highest salary first
