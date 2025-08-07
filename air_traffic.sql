-- Refactored Air Traffic Schema with Data
-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;
CREATE DATABASE air_traffic;
\c air_traffic

-- Create passengers table
CREATE TABLE passengers (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

-- Create airlines table
CREATE TABLE airlines (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

-- Create cities table
CREATE TABLE cities (
    id SERIAL PRIMARY KEY,
    city TEXT NOT NULL,
    country TEXT NOT NULL
);

-- Create a single tickets table with foreign keys
CREATE TABLE tickets (
    id SERIAL PRIMARY KEY,
    passenger_id INTEGER REFERENCES passengers(id),
    seat TEXT NOT NULL,
    departure TIMESTAMP NOT NULL,
    arrival TIMESTAMP NOT NULL,
    airline_id INTEGER REFERENCES airlines(id),
    from_city_id INTEGER REFERENCES cities(id),
    to_city_id INTEGER REFERENCES cities(id)
);

-- Insert data into parent tables first
INSERT INTO passengers (first_name, last_name) VALUES
    ('Jennifer', 'Finch'),
    ('Thadeus', 'Gathercoal'),
    ('Sonja', 'Pauley'),
    ('Waneta', 'Skeleton'),
    ('Berkie', 'Wycliff'),
    ('Alvin', 'Leathes'),
    ('Cory', 'Squibbes');

INSERT INTO airlines (name) VALUES
    ('United'),
    ('British Airways'),
    ('Delta'),
    ('TUI Fly Belgium'),
    ('Air China'),
    ('American Airlines'),
    ('Avianca Brasil');

INSERT INTO cities (city, country) VALUES
    ('Washington DC', 'United States'),
    ('Seattle', 'United States'),
    ('Tokyo', 'Japan'),
    ('London', 'United Kingdom'),
    ('Los Angeles', 'United States'),
    ('Las Vegas', 'United States'),
    ('Mexico City', 'Mexico'),
    ('Paris', 'France'),
    ('Casablanca', 'Morocco'),
    ('Dubai', 'UAE'),
    ('Beijing', 'China'),
    ('New York', 'United States'),
    ('Charlotte', 'United States'),
    ('Cedar Rapids', 'United States'),
    ('Chicago', 'United States'),
    ('New Orleans', 'United States'),
    ('Sao Paolo', 'Brazil'),
    ('Santiago', 'Chile');

-- Insert ticket data referencing the new foreign keys
INSERT INTO tickets (passenger_id, seat, departure, arrival, airline_id, from_city_id, to_city_id) VALUES
    (1, '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 2),
    (2, '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 3, 4),
    (3, '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 5, 6),
    (1, '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 3, 2, 7),
    (4, '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, 8, 9),
    (2, '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 5, 10, 11),
    (5, '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 1, 12, 13),
    (6, '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 6, 14, 15),
    (5, '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 13, 16),
    (7, '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 7, 17, 18);
