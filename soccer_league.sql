DROP DATABASE IF EXISTS soccerleague;

CREATE DATABASE soccerleague;

\c soccerleague

CREATE TABLE league (
    id SERIAL PRIMARY KEY,
    name VARCHAR(36)
);

CREATE TABLE team (
    id SERIAL PRIMARY KEY,
    leagueid INTEGER NOT NULL,
    rank INTEGER NOT NULL,
    FOREIGN KEY (leagueid) REFERENCES league(id)
);

CREATE TABLE player (
    id SERIAL PRIMARY KEY,
    teamid INTEGER NOT NULL,
    name VARCHAR(36),
    FOREIGN KEY (teamid) REFERENCES team(id)
);

CREATE TABLE referee (
    id SERIAL PRIMARY KEY,
    name VARCHAR(36)
);

CREATE TABLE match (
    id SERIAL PRIMARY KEY,
    team1id INTEGER NOT NULL,
    team2id INTEGER NOT NULL,
    FOREIGN KEY (team1id) REFERENCES team(id),
    FOREIGN KEY (team2id) REFERENCES team(id)  
);

CREATE TABLE referee_match (
    matchid INTEGER NOT NULL,
    refereeid INTEGER NOT NULL,
    PRIMARY KEY (matchid, refereeid),
    FOREIGN KEY (matchid) REFERENCES match(id),
    FOREIGN KEY (refereeid) REFERENCES referee(id)
);

CREATE TABLE season (
    id SERIAL PRIMARY KEY,
    startDate DATE NOT NULL,
    endDate DATE NOT NULL,
    leagueid INTEGER NOT NULL,
    FOREIGN KEY (leagueid) REFERENCES league(id)
);

CREATE TABLE goal (
    id SERIAL PRIMARY KEY,
    playerid INTEGER NOT NULL,
    matchid INTEGER NOT NULL,
    FOREIGN KEY (playerid) REFERENCES player(id),
    FOREIGN KEY (matchid) REFERENCES match(id)
);