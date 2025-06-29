select COUNT(first_name) from players
where (bats ="R" AND throws ="L") OR (bats= "L" AND throws="R");
