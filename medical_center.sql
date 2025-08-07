-- Schema for the Medical Center

-- Drop existing tables to ensure a clean slate
DROP TABLE IF EXISTS diagnoses;
DROP TABLE IF EXISTS visits;
DROP TABLE IF EXISTS doctors;
DROP TABLE IF EXISTS patients;
DROP TABLE IF EXISTS diseases;

-- Create the doctors table
CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

-- Create the patients table
CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

-- Create the visits join table to handle the many-to-many relationship
CREATE TABLE visits (
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER REFERENCES doctors(id),
    patient_id INTEGER REFERENCES patients(id),
    visit_date TIMESTAMP NOT NULL
);

-- Create the diseases table
CREATE TABLE diseases (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

-- Create the diagnoses join table to link a disease to a specific visit
CREATE TABLE diagnoses (
    id SERIAL PRIMARY KEY,
    visit_id INTEGER REFERENCES visits(id),
    disease_id INTEGER REFERENCES diseases(id)
);
