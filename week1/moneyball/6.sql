SELECT teams.name,
       SUM(performances.H) AS total_hits
FROM teams
JOIN performances ON performances.team_id = teams.id
WHERE performances.year = 2001
GROUP BY teams.name
ORDER BY total_hits DESC
LIMIT 5;
