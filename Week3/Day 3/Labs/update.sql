UPDATE Staff
SET store_name = 'Miami' where name = 'Paige Turner'

UPDATE Customer 
SET email = CASE
WHEN name = 'Pablo Picasso' THEN 'ppicasso@gmail.com' 
WHEN name = 'Abraham Lincoln' THEN 'lincoln@us.gov'
WHEN name = 'Napoléon Bonaparte' THEN 'hello@napoleon.me'
END
WHERE name in ('Pablo Picasso', 'Abraham Lincoln', 'Napoléon Bonaparte')