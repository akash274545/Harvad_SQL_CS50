select first_name, last_name, debut from players
where birth_city= "Pittsburgh" AND birth_state = "PA"
order by debut desc, first_name, last_name;
