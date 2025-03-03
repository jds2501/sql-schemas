-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artist (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE producer (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE song (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  album TEXT NOT NULL
);

CREATE TABLE artist_song (
  artistid INTEGER NOT NULL,
  songid INTEGER NOT NULL,
  PRIMARY KEY (artistid, songid),
  FOREIGN KEY (artistid) REFERENCES artist(id),
  FOREIGN Key (songid) REFERENCES song(id)
);

CREATE TABLE producer_song (
  producerid INTEGER NOT NULL,
  songid INTEGER NOT NULL,
  PRIMARY KEY (producerid, songid),
  FOREIGN KEY (producerid) REFERENCES producer(id),
  FOREIGN KEY (songid) REFERENCES song(id)
);

