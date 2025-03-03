-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE galaxy (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50)
);

CREATE TABLE star (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50)
);

CREATE TABLE planet (
  id SERIAL PRIMARY KEY,
  name VARCHAR(36) NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  galaxyid INTEGER NOT NULL,
  orbitStarId INTEGER NOT NULL,
  FOREIGN KEY (galaxyid) REFERENCES galaxy(id),
  FOREIGN KEY (orbitStarId) REFERENCES star(id)
);

CREATE TABLE moon (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50),
  planetid INTEGER NOT NULL,
  FOREIGN KEY (planetid) REFERENCES planet(id)
);
