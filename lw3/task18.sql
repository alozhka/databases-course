/*
Вариант 18: пьесы, театры, спектакли
*/

CREATE TABLE IF NOT EXISTS "theatre"
(
    theatre_id  BIGSERIAL    NOT NULL PRIMARY KEY,
    name        VARCHAR(128) NOT NULL UNIQUE,
    description TEXT,
    address     TEXT,
    capacity    SMALLINT CHECK ( capacity > 0 )
);

CREATE TABLE IF NOT EXISTS "author"
(
    author_id  BIGSERIAL   NOT NULL PRIMARY KEY,
    first_name VARCHAR(64) NOT NULL,
    last_name  VARCHAR(64) NOT NULL,
    patronymic VARCHAR(64),
    birth_date DATE
);

CREATE TABLE IF NOT EXISTS "play"
(
    play_id      BIGSERIAL    NOT NULL PRIMARY KEY,
    author_id    BIGSERIAL REFERENCES author (author_id),
    name         VARCHAR(128) NOT NULL UNIQUE,
    description  TEXT,
    written_date DATE
);

CREATE TABLE IF NOT EXISTS "performance"
(
    performance_id BIGSERIAL NOT NULL PRIMARY KEY,
    theatre_id     BIGSERIAL NOT NULL REFERENCES theatre (theatre_id),
    play_id        BIGSERIAL NOT NULL REFERENCES play (play_id),
    time           TIMESTAMP NOT NULL
);

CREATE TABLE IF NOT EXISTS "ticket"
(
    ticket_id      BIGSERIAL NOT NULL PRIMARY KEY,
    performance_id BIGSERIAL NOT NULL REFERENCES performance (performance_id),
    cost           INT CHECK ( cost > 0 ),
    place          SMALLINT  NOT NULL CHECK ( place > 0 ),
    UNIQUE (performance_id, place)
);