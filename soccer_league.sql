-- Schema for a Soccer League

-- Drop existing tables
DROP TABLE IF EXISTS match_referees;
DROP TABLE IF EXISTS goals;
DROP TABLE IF EXISTS matches;
DROP TABLE IF EXISTS players;
DROP TABLE IF EXISTS teams;
DROP TABLE IF EXISTS seasons;
DROP TABLE IF EXISTS referees;

-- Create seasons table
CREATE TABLE seasons (
    id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

-- Create teams table
CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

-- Create players table
CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    current_team_id INTEGER REFERENCES teams(id)
);

-- Create referees table
CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

-- Create matches table
CREATE TABLE matches (
    id SERIAL PRIMARY KEY,
    home_team_id INTEGER REFERENCES teams(id),
    away_team_id INTEGER REFERENCES teams(id),
    match_date DATE NOT NULL,
    season_id INTEGER REFERENCES seasons(id)
);

-- Create goals table
CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players(id),
    match_id INTEGER REFERENCES matches(id)
);

-- Create join table for matches and referees (many-to-many)
CREATE TABLE match_referees (
    match_id INTEGER REFERENCES matches(id),
    referee_id INTEGER REFERENCES referees(id),
    PRIMARY KEY (match_id, referee_id)
);
