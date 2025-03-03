DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE region (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE userAccount (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    preferredRegionID INTEGER NOT NULL,
    FOREIGN KEY (preferredRegionID) REFERENCES region(id)
);

CREATE TABLE category (
    id SERIAL PRIMARY KEY,
    name VARCHAR(30)
);

CREATE TABLE post (
    id SERIAL PRIMARY KEY,
    title VARCHAR(50),
    text TEXT,
    userAccountid INTEGER NOT NULL,
    regionid INTEGER NOT NULL,
    location VARCHAR(50),
    categoryid INTEGER NOT NULL,
    FOREIGN KEY (userAccountid) REFERENCES userAccount(id),
    FOREIGN KEY (regionid) REFERENCES region(id),
    FOREIGN KEY (categoryid) REFERENCES category(id)
);