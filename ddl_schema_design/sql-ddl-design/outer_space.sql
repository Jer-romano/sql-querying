-- from the terminal run:
-- psql < outer_space.sql
-- I've improved this database by adding a 'stars' table and 'galaxies' table. That way, common stars like the 
-- Sun and common galaxies like the Milky Way are not repeated so much. 
-- I also changed the data type of some columns like 'name' to varchar(30) rather than TEXT.
-- Also, instead of putting the list of moons of each planet in an array, I created a 'moons' table. Each 
-- entry is simply the name of the moon, and the id of the planet it orbits around. 
DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

--Diameter is in millions of kilometers
CREATE TABLE stars
(
  id SERIAL PRIMARY KEY,
  name varchar(30) NOT NULL,
  diameter FLOAT
);

CREATE TABLE galaxies
(
  id SERIAL PRIMARY KEY,
  name varchar(30) NOT NULL
);

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name varchar(30) NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around INTEGER NOT NULL REFERENCES stars(id),
  galaxy INTEGER NOT NULL REFERENCES galaxies(id)
);

CREATE TABLE moons
(
  id SERIAL PRIMARY KEY,
  name varchar(30),
  orbits_around INTEGER NOT NULL REFERENCES planets(id)
);

-- Insert statements

INSERT INTO galaxies
  (name)
  VALUES
  ('The Milky Way');

INSERT INTO stars
(name, diameter)
VALUES
('The Sun', 1.4),
('Proxima Centauri', 0.2),
('Gliese 876', 0.5);


INSERT INTO planets
  (name, orbital_period_in_years, orbits_around, galaxy)
VALUES
  ('Earth', 1.00, 1, 1),
  ('Mars', 1.88, 1, 1),
  ('Venus', 0.62, 1, 1),
  ('Neptune', 164.8, 1, 1),
  ('Proxima Centauri b', 0.03, 2, 1),
  ('Gliese 876 b', 0.23, 3, 1);

  INSERT INTO moons
  (name, orbits_around)
  VALUES
  ('The Moon', 1),
  ('Phobos', 2),
  ('Deimos', 2),
  ('NA', 3),
  ('Naiad', 4),
  ('Thalassa', 4),
  ('Despina', 4),
  ('Galatea', 4),
  ('Larissa', 4),
  ('S/2004 N 1', 4),
  ('Proteus', 4),
  ('Triton', 4),
  ('Nereid', 4),
  ('Halimede', 4),
  ('Sao', 4),
  ('Laomedeia', 4),
  ('Psamathe', 4),
  ('Neso', 4),
  ('NA', 5),
  ('NA', 6);
