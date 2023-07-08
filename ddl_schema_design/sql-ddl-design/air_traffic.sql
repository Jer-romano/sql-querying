-- from the terminal run:
-- psql < air_traffic.sql
-- Improvements: I split the 'tickets' table up so that it is more normalized and there is less repetition. 
-- The 'tickets' table now has foreign keys for customer, airline, departure city,  and destination city.
-- Also changed most of the TEXT data types to varchar (to save space) 

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE customers
(
  id SERIAL PRIMARY KEY,
  first_name varchar(30) NOT NULL,
  last_name varchar(30) NOT NULL
);

CREATE TABLE countries
(
  id SERIAL PRIMARY KEY,
  name varchar(30) NOT NULL
);

CREATE TABLE cities
(
  id SERIAL PRIMARY KEY,
  name varchar(50) NOT NULL,
  country_id INTEGER NOT NULL REFERENCES countries(id) 
);

CREATE TABLE airlines 
(
  id serial PRIMARY KEY,
  name varchar(30) NOT NULL
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  customer_id INTEGER NOT NULL REFERENCES customers(id),
  seat varchar(5) NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline_id INTEGER NOT NULL REFERENCES airlines(id),
  from_city_id INTEGER NOT NULL REFERENCES cities(id),
  to_city_id INTEGER NOT NULL REFERENCES cities(id)
);

INSERT INTO customers
(first_name, last_name)
VALUES
('Jennifer', 'Finch'),
('Thadeus', 'Gathercoal'),
('Sonja', 'Pauley'),
('Waneta', 'Skeleton'),
('Berkie', 'Wycliff'),
('Alvin', 'Leathes'),
('Cory', 'Squibbes');

INSERT INTO countries
(name)
VALUES
('United States'), --1
('United Kingdom'),
('Japan'),
('France'),
('UAE'),
('Brazil'), --6
('Mexico'),
('Morocco'), --8
('China'),
('Chile');

INSERT INTO cities
(name, country_id)
VALUES
('Washington DC', 1), --1
('Seattle', 1),
('Los Angeles', 1),
('Las Vegas', 1),
('New York', 1),  --5
('Charlotte', 1),
('Cedar Rapids', 1),
('Chicago', 1),
('New Orleans', 1),
('London', 2), --10
('Tokyo', 3),
('Mexico City', 7),
('Paris', 4),
('Dubai', 5),
('Sao Paolo', 6), --15
('Casablanca', 8),
('Beijing', 9),
('Santiago', 10);

INSERT INTO airlines
(name)
VALUES
('United'),
('British Airways'),
('Delta'),
('TUI Fly Belgium'),
('Air China'),
('American Airlines'),
('Avianca Brasil');

INSERT INTO tickets
  (customer_id, seat, departure, arrival, airline_id, from_city_id, to_city_id)
VALUES
  (1, '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 2),
  (2, '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 11, 10),
  (3, '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 3, 4),
  (1, '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 3, 2, 12),
  (4, '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, 13, 16),
  (2, '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 5, 14, 17),
  (5, '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 1, 5, 6),
  (6, '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 6, 7, 8),
  (5, '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 6, 9),
  (7, '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 7, 15, 18);