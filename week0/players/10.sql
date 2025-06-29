select first_name as 'First Name', last_name as 'Last Name' from players
where final_game like "2022-%"
order by first_name, last_name;
