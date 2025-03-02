/*
19. Соревнования, спортсмены, выступления.
*/

CREATE TABLE IF NOT EXISTS athlete
(
    athlete_id BIGSERIAL    NOT NULL PRIMARY KEY,
    last_name  VARCHAR(128) NOT NULL,
    first_name VARCHAR(128) NOT NULL,
    patronymic VARCHAR(128),
    birth_date DATE
);

CREATE TABLE IF NOT EXISTS sport
(
    sport_id    BIGSERIAL   NOT NULL PRIMARY KEY,
    name        VARCHAR(64) NOT NULL,
    description TEXT
);

CREATE TABLE IF NOT EXISTS competition
(
    competition_id BIGSERIAL    NOT NULL PRIMARY KEY,
    sport_id       BIGSERIAL    NOT NULL REFERENCES sport (sport_id),
    title          VARCHAR(256) NOT NULL UNIQUE,
    description    TEXT,
    start_date     DATE         NOT NULL,
    end_date       DATE         NOT NULL,
    location       TEXT         NOT NULL
);

CREATE TABLE IF NOT EXISTS competition_age_group
(
    competition_age_group_id BIGSERIAL NOT NULL PRIMARY KEY,
    competition_id           BIGSERIAL NOT NULL REFERENCES competition (competition_id),
    younger_age              SMALLINT CHECK ( younger_age > 0 ),
    older_age                SMALLINT CHECK ( older_age > younger_age ),
    UNIQUE (competition_id, younger_age, older_age)
);

CREATE TABLE IF NOT EXISTS performance
(
    competition_age_group BIGSERIAL NOT NULL REFERENCES competition_age_group (competition_age_group_id),
    athlete_id            BIGSERIAL NOT NULL REFERENCES athlete (athlete_id),
    place                 SMALLINT  NOT NULL CHECK ( place > 0 ),
    score                 INT
);