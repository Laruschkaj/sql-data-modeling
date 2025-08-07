-- Refactored Outer Space Schema with Data
-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;
CREATE DATABASE outer_space;
\c outer_space

-- Create galaxies table
CREATE TABLE galaxies (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

-- Create stars table and link to galaxies
CREATE TABLE stars (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    galaxy_id INTEGER REFERENCES galaxies(id)
);

-- Create planets table and link to stars
CREATE TABLE planets (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    orbital_period_in_years FLOAT NOT NULL,
    star_id INTEGER REFERENCES stars(id)
);

-- Create moons table and link to planets
CREATE TABLE moons (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    planet_id INTEGER REFERENCES planets(id)
);

-- Insert data into the galaxies table first
INSERT INTO galaxies (name) VALUES ('Milky Way');

-- Insert data into the stars table, referencing the galaxy
INSERT INTO stars (name, galaxy_id) VALUES ('The Sun', 1), ('Proxima Centauri', 1), ('Gliese 876', 1);

-- Insert data into the planets table, referencing the stars
INSERT INTO planets (name, orbital_period_in_years, star_id) VALUES
    ('Earth', 1.00, 1),
    ('Mars', 1.88, 1),
    ('Venus', 0.62, 1),
    ('Neptune', 164.8, 1),
    ('Proxima Centauri b', 0.03, 2),
    ('Gliese 876 b', 0.23, 3);

-- Insert data into the moons table, referencing the planets
INSERT INTO moons (name, planet_id) VALUES
    ('The Moon', 1),
    ('Phobos', 2),
    ('Deimos', 2),
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
    ('Neso', 4);
