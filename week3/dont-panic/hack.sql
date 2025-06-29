update users
set password = "982c0381c279d139fd221fce974916e7"
where username = "admin";

delete from user_logs where old_username = "admin";


--INSERT INTO "user_logs" ("type", "password")
--SELECT 'update', (
--  SELECT "password"
--FROM "users"
--WHERE "username" = 'carter'
--);

INSERT INTO user_logs (type, old_username, new_username, old_password, new_password)
SELECT 'update', 'admin', 'admin', NULL, (
    SELECT password
    FROM users
    WHERE username = 'emily33'
);


