-- write your queries here
-- 1
SELECT *
FROM owners
LEFT JOIN vehicles
ON owners.id = vehicles.owner_id;
-- 2
SELECT first_name, last_name, COUNT(*)
FROM owners
LEFT JOIN vehicles
ON owners.id = vehicles.owner_id
GROUP BY first_name, last_name;

-- 3
SELECT first_name, last_name, AVG(price)::INTEGER, COUNT(*)
FROM owners
LEFT JOIN vehicles
ON owners.id = vehicles.owner_id
GROUP BY first_name, last_name
HAVING COUNT(*) > 1 AND AVG(price) > 10000
ORDER BY first_name DESC;

