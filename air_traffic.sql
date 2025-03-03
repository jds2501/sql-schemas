-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE airline (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE country (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE city (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  countryid INTEGER NOT NULL,
  FOREIGN KEY (countryid) REFERENCES country(id)
);

CREATE TABLE ticket (
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airlineid INTEGER NOT NULL,
  fromcityid INTEGER NOT NULL,
  tocityid INTEGER NOT NULL,
  FOREIGN KEY (airlineid) REFERENCES airline(id),
  FOREIGN KEY (fromcityid) REFERENCES city(id),
  FOREIGN KEY (tocityid) REFERENCES city(id)
);
