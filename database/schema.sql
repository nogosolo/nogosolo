-- use the following command to start the database --
-- psql postgres -U nogosolo < schema.sql--

DROP DATABASE IF EXISTS nogosolo;
--
CREATE DATABASE nogosolo;
--
\connect nogosolo;

CREATE TABLE users (
  id SERIAL,
  name VARCHAR(25) NULL DEFAULT NULL,
  username VARCHAR(25) NULL DEFAULT NULL,
  password VARCHAR(25) NULL DEFAULT NULL,
  bio VARCHAR(255) NULL DEFAULT NULL,
  picture VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE user_event (
  id SERIAL,
  userId INTEGER NOT NULL,
  eventId VARCHAR(255) NOT NULL,
  date TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE match (
  id SERIAL,
  user1 INTEGER NOT NULL,
  user2 INTEGER NOT NULL,
  status BIT NULL DEFAULT NULL,
  PRIMARY KEY (id)
);

ALTER TABLE user_event ADD FOREIGN KEY (userId) REFERENCES users (id);
ALTER TABLE match ADD FOREIGN KEY (user1) REFERENCES users (id);
ALTER TABLE match ADD FOREIGN KEY (user2) REFERENCES users (id);
