DROP DATABASE IF EXISTS medicalcenter;

CREATE DATABASE medicalcenter;

\c medicalcenter

CREATE TABLE doctor (
    id SERIAL PRIMARY KEY,
    firstName VARCHAR(30) NOT NULL,
    lastName VARCHAR(30) NOT NULL,
    medicalID INTEGER NOT NULL
);

CREATE TABLE patient (
    id SERIAL PRIMARY KEY,
    firstName VARCHAR(30) NOT NULL,
    lastName VARCHAR(30) NOT NULL
);

CREATE TABLE visit (
    id SERIAL PRIMARY KEY,
    patientid INTEGER NOT NULL,
    doctorid INTEGER NOT NULL,
    visitDate DATE,
    FOREIGN KEY (patientid) REFERENCES patient(id),
    FOREIGN KEY (doctorid) REFERENCES doctor(id)
);

CREATE TABLE disease (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE diagnosis (
    id SERIAL PRIMARY KEY,
    visitid INTEGER NOT NULL,
    diseaseid INTEGER NOT NULL,
    FOREIGN KEY (visitid) REFERENCES visit(id),
    FOREIGN KEY (diseaseid) REFERENCES disease(id)
);