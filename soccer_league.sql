DROP DATABASE IF EXISTS soccerleague;

CREATE DATABASE soccerleague;

\c soccerleague

-- Same
CREATE TABLE season (
    id SERIAL PRIMARY KEY,
    startDate DATE NOT NULL,
    endDate DATE NOT NULL
);

-- DIff on rank
CREATE TABLE team (
    id SERIAL PRIMARY KEY,
    leagueid INTEGER NOT NULL,
    rank INTEGER NOT NULL
);

-- same
CREATE TABLE referee (
    id SERIAL PRIMARY KEY,
    name VARCHAR(36)
);

-- close enough
CREATE TABLE player (
    id SERIAL PRIMARY KEY,
    teamid INTEGER NOT NULL,
    name VARCHAR(36),
    FOREIGN KEY (teamid) REFERENCES team(id)
);

-- close enough
CREATE TABLE match (
    id SERIAL PRIMARY KEY,
    team1id INTEGER NOT NULL,
    team2id INTEGER NOT NULL,
    seasonid INTEGER NOT NULL,
    FOREIGN KEY (team1id) REFERENCES team(id),
    FOREIGN KEY (team2id) REFERENCES team(id),
    FOREIGN KEY (seasonid) REFERENCES season(id)
);

CREATE TYPE match_result AS ENUM ('Win', 'Loss', 'Draw');

CREATE TABLE result (
    id SERIAL PRIMARY KEY,
    matchid INTEGER NOT NULL,
    teamid INTEGER NOT NULL,
    result match_result NOT NULL,
    FOREIGN KEY (matchid) REFERENCES match(id),
    FOREIGN KEY (teamid) REFERENCES team(id)
);

-- Different, but I like mine better
CREATE TABLE referee_match (
    matchid INTEGER NOT NULL,
    refereeid INTEGER NOT NULL,
    PRIMARY KEY (matchid, refereeid),
    FOREIGN KEY (matchid) REFERENCES match(id),
    FOREIGN KEY (refereeid) REFERENCES referee(id)
);

-- Same
CREATE TABLE goal (
    id SERIAL PRIMARY KEY,
    playerid INTEGER NOT NULL,
    matchid INTEGER NOT NULL,
    FOREIGN KEY (playerid) REFERENCES player(id),
    FOREIGN KEY (matchid) REFERENCES match(id)
);