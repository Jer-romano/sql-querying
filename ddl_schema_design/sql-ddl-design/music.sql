-- from the terminal run:
-- psql < music.sql
-- Improvements: Took the artist and producer info out of the songs table and
-- added 3 tables: artists, producers, and songs_and_artists_and_producers
-- The songs_and_artists_and_producers table will tell you who performed in what song, and who produced it. 
-- Occasionally, there is a NULL value in either the artist or producer column, and this is when there are more
-- artists than producers or vice versa. 
DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  name varchar(50) NOT NULL
);

CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  name varchar(50) NOT NULL
);

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  album TEXT NOT NULL
);

CREATE TABLE songs_and_artists_and_producers
(
  id SERIAL PRIMARY KEY,
  song_id INTEGER REFERENCES songs(id),
  artist_id INTEGER REFERENCES artists(id),
  producer_id INTEGER REFERENCES producers(id)
);

INSERT INTO artists
(name)
VALUES
('Hanson'), --1 
('Queen'),
('Mariah Cary'),
('Boyz II Men'),
('Lady Gaga'),  -- 5
('Bradley Cooper'),
('Nickelback'),
('Jay Z'),
('Alicia Keys'),
('Katy Perry'), --10
('Juicy J'),
('Maroon 5'),
('Christina Aguilera'),
('Avril Lavigne'),
('Destiny''s Child'); --15

INSERT INTO producers
(name)
VALUES
('Dust Brothers'),  --1
('Stephen Lironi'),
('Roy Thomas Baker'),
('Walter Afanasieff'),
('Benjamin Rice'),  --5
('Rick Parashar'),
('Al Shux'),
('Max Martin'),
('Cirkut'),
('Shellback'),  --10
('Benny Blanco'),
('The Matrix'),
('Darkchild');  --13 

INSERT INTO songs
  (title, duration_in_seconds, release_date, album)
VALUES
  ('MMMBop', 238, '04-15-1997',  'Middle of Nowhere'),
  ('Bohemian Rhapsody', 355, '10-31-1975',  'A Night at the Opera'),
  ('One Sweet Day', 282, '11-14-1995',  'Daydream'),
  ('Shallow', 216, '09-27-2018',  'A Star Is Born'),
  ('How You Remind Me', 223, '08-21-2001', 'Silver Side Up'),
  ('New York State of Mind', 276, '10-20-2009',  'The Blueprint 3'),
  ('Dark Horse', 215, '12-17-2013',  'Prism'),
  ('Moves Like Jagger', 201, '06-21-2011', 'Hands All Over'),
  ('Complicated', 244, '05-14-2002', 'Let Go'),
  ('Say My Name', 240, '11-07-1999',  'The Writing''s on the Wall');

INSERT INTO songs_and_artists_and_producers
(song_id, artist_id, producer_id)
VALUES
(1, 1, 1),
(1, NULL, 2),
(2, 2, 3),
(3, 3, 4),
(3, 4, NULL),
(4, 5, 5),
(4, 6, NULL),
(5, 7, 6),
(6, 8, 7),
(6, 9, NULL),
(7, 10, 8),
(7, 11, 9),
(8, 12, 10),
(8, 13, 11),
(9, 14, 12),
(10, 15, 13);