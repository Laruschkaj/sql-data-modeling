-- Refactored Music Schema with Data
-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;
CREATE DATABASE music;
\c music

-- Create artists table
CREATE TABLE artists (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

-- Create producers table
CREATE TABLE producers (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

-- Create albums table
CREATE TABLE albums (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    release_date DATE NOT NULL
);

-- Create songs table and link to albums
CREATE TABLE songs (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    duration_in_seconds INTEGER NOT NULL,
    album_id INTEGER REFERENCES albums(id)
);

-- Join table for songs and artists (many-to-many)
CREATE TABLE song_artists (
    song_id INTEGER REFERENCES songs(id),
    artist_id INTEGER REFERENCES artists(id),
    PRIMARY KEY (song_id, artist_id)
);

-- Join table for songs and producers (many-to-many)
CREATE TABLE song_producers (
    song_id INTEGER REFERENCES songs(id),
    producer_id INTEGER REFERENCES producers(id),
    PRIMARY KEY (song_id, producer_id)
);

-- Insert data into parent tables
INSERT INTO artists (name) VALUES
    ('Hanson'),
    ('Queen'),
    ('Mariah Cary'),
    ('Boyz II Men'),
    ('Lady Gaga'),
    ('Bradley Cooper'),
    ('Nickelback'),
    ('Jay Z'),
    ('Alicia Keys'),
    ('Katy Perry'),
    ('Juicy J'),
    ('Maroon 5'),
    ('Christina Aguilera'),
    ('Avril Lavigne'),
    ('Destiny''s Child');

INSERT INTO producers (name) VALUES
    ('Dust Brothers'),
    ('Stephen Lironi'),
    ('Roy Thomas Baker'),
    ('Walter Afanasieff'),
    ('Benjamin Rice'),
    ('Rick Parashar'),
    ('Al Shux'),
    ('Max Martin'),
    ('Cirkut'),
    ('Shellback'),
    ('Benny Blanco'),
    ('The Matrix'),
    ('Darkchild');

INSERT INTO albums (name, release_date) VALUES
    ('Middle of Nowhere', '1997-04-15'),
    ('A Night at the Opera', '1975-10-31'),
    ('Daydream', '1995-11-14'),
    ('A Star Is Born', '2018-09-27'),
    ('Silver Side Up', '2001-08-21'),
    ('The Blueprint 3', '2009-10-20'),
    ('Prism', '2013-12-17'),
    ('Hands All Over', '2011-06-21'),
    ('Let Go', '2002-05-14'),
    ('The Writing''s on the Wall', '1999-11-07');

-- Insert song data referencing albums
INSERT INTO songs (title, duration_in_seconds, album_id) VALUES
    ('MMMBop', 238, 1),
    ('Bohemian Rhapsody', 355, 2),
    ('One Sweet Day', 282, 3),
    ('Shallow', 216, 4),
    ('How You Remind Me', 223, 5),
    ('New York State of Mind', 276, 6),
    ('Dark Horse', 215, 7),
    ('Moves Like Jagger', 201, 8),
    ('Complicated', 244, 9),
    ('Say My Name', 240, 10);

-- Insert data into join tables for many-to-many relationships
-- Song 1: MMMBop
INSERT INTO song_artists (song_id, artist_id) VALUES (1, 1);
INSERT INTO song_producers (song_id, producer_id) VALUES (1, 1), (1, 2);

-- Song 2: Bohemian Rhapsody
INSERT INTO song_artists (song_id, artist_id) VALUES (2, 2);
INSERT INTO song_producers (song_id, producer_id) VALUES (2, 3);

-- Song 3: One Sweet Day
INSERT INTO song_artists (song_id, artist_id) VALUES (3, 3), (3, 4);
INSERT INTO song_producers (song_id, producer_id) VALUES (3, 4);

-- Song 4: Shallow
INSERT INTO song_artists (song_id, artist_id) VALUES (4, 5), (4, 6);
INSERT INTO song_producers (song_id, producer_id) VALUES (4, 5);

-- Song 5: How You Remind Me
INSERT INTO song_artists (song_id, artist_id) VALUES (5, 7);
INSERT INTO song_producers (song_id, producer_id) VALUES (5, 6);

-- Song 6: New York State of Mind
INSERT INTO song_artists (song_id, artist_id) VALUES (6, 8), (6, 9);
INSERT INTO song_producers (song_id, producer_id) VALUES (6, 7);

-- Song 7: Dark Horse
INSERT INTO song_artists (song_id, artist_id) VALUES (7, 10), (7, 11);
INSERT INTO song_producers (song_id, producer_id) VALUES (7, 8), (7, 9);

-- Song 8: Moves Like Jagger
INSERT INTO song_artists (song_id, artist_id) VALUES (8, 12), (8, 13);
INSERT INTO song_producers (song_id, producer_id) VALUES (8, 10), (8, 11);

-- Song 9: Complicated
INSERT INTO song_artists (song_id, artist_id) VALUES (9, 14);
INSERT INTO song_producers (song_id, producer_id) VALUES (9, 12);

-- Song 10: Say My Name
INSERT INTO song_artists (song_id, artist_id) VALUES (10, 15);
INSERT INTO song_producers (song_id, producer_id) VALUES (10, 13);
