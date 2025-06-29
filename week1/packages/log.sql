
-- *** The Lost Letter ***
select * from addresses
where address = "900 Somerville Avenue";

select * from addresses
where address LIKE  "2 Fin%";

select * from packages
where from_address_id = (
    select id from addresses
    where address = "900 Somerville Avenue"
) AND to_address_id =(
    select id from addresses
where address LIKE  "2 Fin%"
);

select * from scans
where package_id = (select id from packages
where from_address_id = (
    select id from addresses
    where address = "900 Somerville Avenue"
) AND to_address_id =(
    select id from addresses
where address LIKE  "2 Fin%"
)
);

-- *** The Devious Delivery ***
select * from packages
where from_address_id is null;

select id from packages
where from_address_id is null;

select * from scans
where package_id = (
    select id from packages
    where from_address_id is null
);


select address_id from scans
where package_id = (
    select id from packages
    where from_address_id is null
) and action = 'Drop';


select * from addresses
where id = (
    select address_id from scans
where package_id = (
    select id from packages
    where from_address_id is null
) and action = 'Drop'
);

-- *** The Forgotten Gift ***
select id from addresses
where address = '109 Tileston Street';

select * from packages
where from_address_id = (
    select id from addresses
    where address = '109 Tileston Street'
);

select * from addresses
where id = 4983;

select id from packages
where from_address_id = (
    select id from addresses
    where address = '109 Tileston Street'
);

select driver_id from scans
where package_id = (
    select id from packages
where from_address_id = (
    select id from addresses
    where address = '109 Tileston Street'
)
)
order by timestamp desc
limit 1;


select name from drivers
where id =(
    select driver_id from scans
where package_id = (
    select id from packages
where from_address_id = (
    select id from addresses
    where address = '109 Tileston Street'
)
)
order by timestamp desc
limit 1
);

