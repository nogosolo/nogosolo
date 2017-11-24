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
  status BOOLEAN DEFAULT NULL,
  PRIMARY KEY (id)
);

ALTER TABLE user_event ADD FOREIGN KEY (userId) REFERENCES users (id);
ALTER TABLE match ADD FOREIGN KEY (user1) REFERENCES users (id);
ALTER TABLE match ADD FOREIGN KEY (user2) REFERENCES users (id);

--
--
-- SELECT distinct u.id, u.name, u2.name as "matchName", u2.id as "matchId" FROM users u
--   INNER JOIN user_event ue
--     ON u.id = ue.userid
--   INNER JOIN match m
--     ON u.id = m.user1
--   INNER JOIN users u2
--     ON m.user2 = u2.id
--   WHERE m.status IS NULL AND u.username = 'theBeth'
--   limit 1;
--
--
-- SELECT eventId from user_event
--   WHERE userId = 1;
--
--
--
--
--   SELECT distinct u.id, u2.name as "matchName"
--   , u2.id as "matchId", u2.bio, u2.picture FROM users u
--     INNER JOIN user_event ue
--       ON u.id = ue.userid
--     INNER JOIN match m
--       ON u.id = m.user1
--     INNER JOIN users u2
--       ON m.user2 = u2.id
--     WHERE m.status IS NULL AND u.username = 'theBeth'
--     limit 1;
