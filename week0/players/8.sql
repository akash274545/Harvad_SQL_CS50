select round(avg(height),2) AS "Average Height", round(AVG(weight),2) as "Average Weight" from players
where debut >= "2000-01-01";
