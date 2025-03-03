DROP DATABASE IF EXISTS medicalcenter;

CREATE DATABASE medicalcenter;

\c medicalcenter

CREATE TABLE medicalCenter (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE doctor (
    id SERIAL PRIMARY KEY,
    firstName VARCHAR(30) NOT NULL,
    lastName VARCHAR(30) NOT NULL,
    medicalID INTEGER NOT NULL,
    FOREIGN KEY (medicalID) REFERENCES medicalCenter(id)
);

CREATE TABLE patient (
    id SERIAL PRIMARY KEY,
    firstName VARCHAR(30) NOT NULL,
    lastName VARCHAR(30) NOT NULL
);

CREATE TABLE doctor_patient (
    doctorid INTEGER,
    patientid INTEGER,
    PRIMARY KEY (doctorid, patientid),
    FOREIGN KEY (doctorid) REFERENCES doctor(id),
    FOREIGN KEY (patientid) REFERENCES patient(id)
);

CREATE TABLE visit (
    id SERIAL PRIMARY KEY,
    patientid INTEGER NOT NULL,
    visitDate DATE,
    FOREIGN KEY (patientid) REFERENCES patient(id)
);

CREATE TABLE disease (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    visitid INTEGER NOT NULL,
    FOREIGN KEY (visitid) REFERENCES visit(id)
);