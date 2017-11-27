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

CREATE TABLE users_events (
  id SERIAL,
  userId INTEGER NOT NULL,
  eventId VARCHAR(255) NOT NULL,
  eventInfoStr VARCHAR(255) NULL DEFAULT NULL,
  -- date TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE match (
  id SERIAL,
  user1 INTEGER NOT NULL,
  user2 INTEGER NOT NULL,
  status BOOLEAN DEFAULT NULL,
  PRIMARY KEY (id)
);

ALTER TABLE users_events ADD FOREIGN KEY (userId) REFERENCES users (id);
ALTER TABLE match ADD FOREIGN KEY (user1) REFERENCES users (id);
ALTER TABLE match ADD FOREIGN KEY (user2) REFERENCES users (id);
-- pg_dump --table=users --data-only --column-inserts nogosolo > data.sql



SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: nogosolo
--

INSERT INTO users (id, name, username, password, bio, picture) VALUES (1, 'Allen Price', 'hackerpirate', 'hackreactor', 'I am the leader of a band of puny giraffe pirates and I code on the side.', 'https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAAKuAAAAJDQxMDgwYWYwLTdjZmEtNDkwMy04NDAzLTU0MDQ2N2I1YTA4ZA.jpg');
INSERT INTO users (id, name, username, password, bio, picture) VALUES (2, 'Beth Johnson', 'theBeth', 'bethcoin', 'I like hugs.  I LUV hugs.  Please hug me', 'https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAAKuAAAAJDQxMDgwYWYwLTdjZmEtNDkwMy04NDAzLTU0MDQ2N2I1YTA4ZA.jpg');
INSERT INTO users (id, name, username, password, bio, picture) VALUES (3, 'Doug Calhoun', 'hacker1', 'hackreactor', 'Come to office hours and hang out with me', 'https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAAKuAAAAJDQxMDgwYWYwLTdjZmEtNDkwMy04NDAzLTU0MDQ2N2I1YTA4ZA.jpg');
INSERT INTO users (id, name, username, password, bio, picture) VALUES (4, 'Easak Hong', 'KoreanInCleveland', 'creativePassword', 'I have a mini-me named Kevin and I play fantasy football', 'https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAAKuAAAAJDQxMDgwYWYwLTdjZmEtNDkwMy04NDAzLTU0MDQ2N2I1YTA4ZA.jpg');
INSERT INTO users (id, name, username, password, bio, picture) VALUES (5, 'Guillaume Choupeaux', 'Gui', 'cheeseandwine', 'I am French and I work at Apple', 'https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAAKuAAAAJDQxMDgwYWYwLTdjZmEtNDkwMy04NDAzLTU0MDQ2N2I1YTA4ZA.jpg');
INSERT INTO users (id, name, username, password, bio, picture) VALUES (6, 'Angela Huang', 'googleswag', 'angelsanddemons', 'I like to rub my fingers together', 'https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAAKuAAAAJDQxMDgwYWYwLTdjZmEtNDkwMy04NDAzLTU0MDQ2N2I1YTA4ZA.jpg');
INSERT INTO users (id, name, username, password, bio, picture) VALUES (7, 'Aric Alves', 'AricnotEric', 'rektatorbot', 'I climb and boulder and think toy problems have no constraints', 'https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAAKuAAAAJDQxMDgwYWYwLTdjZmEtNDkwMy04NDAzLTU0MDQ2N2I1YTA4ZA.jpg');
INSERT INTO users (id, name, username, password, bio, picture) VALUES (9, 'Brian Pak', 'pacman', 'wokawokawoka', 'Elevators hate me', 'https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAAKuAAAAJDQxMDgwYWYwLTdjZmEtNDkwMy04NDAzLTU0MDQ2N2I1YTA4ZA.jpg');
INSERT INTO users (id, name, username, password, bio, picture) VALUES (8, 'Andy Nguyen', 'keyboardmaster', 'qwertydvorak', 'I am the termial wizard that makes your computer work', 'https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAAKuAAAAJDQxMDgwYWYwLTdjZmEtNDkwMy04NDAzLTU0MDQ2N2I1YTA4ZA.jpg');
INSERT INTO users (id, name, username, password, bio, picture) VALUES (10, 'Andrew Chalker', 'soccerpro1', 'goawayKevin', 'I love lasagna', 'https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAAKuAAAAJDQxMDgwYWYwLTdjZmEtNDkwMy04NDAzLTU0MDQ2N2I1YTA4ZA.jpg');
INSERT INTO users (id, name, username, password, bio, picture) VALUES (11, 'Calvin Wong', 'fantasyfootballgod', 'allidoiswin', 'I know lots of fun things you can do with a lacrosse ball', 'https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAAKuAAAAJDQxMDgwYWYwLTdjZmEtNDkwMy04NDAzLTU0MDQ2N2I1YTA4ZA.jpg');
INSERT INTO users (id, name, username, password, bio, picture) VALUES (12, 'Lam Bui', 'lamboozled', '123456', 'I do a great Louis Armstrong impersonation', 'https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAAKuAAAAJDQxMDgwYWYwLTdjZmEtNDkwMy04NDAzLTU0MDQ2N2I1YTA4ZA.jpg');
INSERT INTO users (id, name, username, password, bio, picture) VALUES (13, 'Tiffany Pham', 'tiff', 'abcdefg', 'I have snacks!', 'https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAAKuAAAAJDQxMDgwYWYwLTdjZmEtNDkwMy04NDAzLTU0MDQ2N2I1YTA4ZA.jpg');
INSERT INTO users (id, name, username, password, bio, picture) VALUES (14, 'Carrie Zhang', 'soreshoulders', 'cookies', 'I like cookies.  Feed me cookies', 'https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAAKuAAAAJDQxMDgwYWYwLTdjZmEtNDkwMy04NDAzLTU0MDQ2N2I1YTA4ZA.jpg');
INSERT INTO users (id, name, username, password, bio, picture) VALUES (15, 'Daniel London', 'unknowntheory', 'butIknow', 'I have a twin brother you might have seen somewhere', 'https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAAKuAAAAJDQxMDgwYWYwLTdjZmEtNDkwMy04NDAzLTU0MDQ2N2I1YTA4ZA.jpg');
INSERT INTO users (id, name, username, password, bio, picture) VALUES (16, 'Ephraim Glick', 'thescottishdonut', 'isnull', 'I am really tall', 'https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAAKuAAAAJDQxMDgwYWYwLTdjZmEtNDkwMy04NDAzLTU0MDQ2N2I1YTA4ZA.jpg');
INSERT INTO users (id, name, username, password, bio, picture) VALUES (17, 'Jaqueline Leung', 'wetsocks', 'ohshit', 'Oh shit', 'https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAAKuAAAAJDQxMDgwYWYwLTdjZmEtNDkwMy04NDAzLTU0MDQ2N2I1YTA4ZA.jpg');
INSERT INTO users (id, name, username, password, bio, picture) VALUES (18, 'Javier Enriquez', 'Javy', 'lkjhg', 'Did you know cops can legally lie to you?', 'https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAAKuAAAAJDQxMDgwYWYwLTdjZmEtNDkwMy04NDAzLTU0MDQ2N2I1YTA4ZA.jpg');
INSERT INTO users (id, name, username, password, bio, picture) VALUES (19, 'Jennifer Shen', 'jenn', 'abcde', 'I sometimes leave my phone in my pocket', 'https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAAKuAAAAJDQxMDgwYWYwLTdjZmEtNDkwMy04NDAzLTU0MDQ2N2I1YTA4ZA.jpg');
INSERT INTO users (id, name, username, password, bio, picture) VALUES (20, 'Justin Cruz', 'iamascribe', 'cowboycode', 'Prime D-Rose got nothing on me', 'https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAAKuAAAAJDQxMDgwYWYwLTdjZmEtNDkwMy04NDAzLTU0MDQ2N2I1YTA4ZA.jpg');
INSERT INTO users (id, name, username, password, bio, picture) VALUES (21, 'Kevin Fang', 'iamnoteasak', 'punchemintheface', 'I am not Easak.  I am not mini-me', 'https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAAKuAAAAJDQxMDgwYWYwLTdjZmEtNDkwMy04NDAzLTU0MDQ2N2I1YTA4ZA.jpg');
INSERT INTO users (id, name, username, password, bio, picture) VALUES (22, 'Kory Kilpatrick', 'riverrat', 'poker', 'I only play for Bethcoin', 'https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAAKuAAAAJDQxMDgwYWYwLTdjZmEtNDkwMy04NDAzLTU0MDQ2N2I1YTA4ZA.jpg');
INSERT INTO users (id, name, username, password, bio, picture) VALUES (23, 'Kuyik Akpan', 'kuyik', 'a1b2c3', 'I did my project in backbone', 'https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAAKuAAAAJDQxMDgwYWYwLTdjZmEtNDkwMy04NDAzLTU0MDQ2N2I1YTA4ZA.jpg');
INSERT INTO users (id, name, username, password, bio, picture) VALUES (24, 'Michael Flis', 'bennyhill', 'poiuy', 'Where did my car go?', 'https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAAKuAAAAJDQxMDgwYWYwLTdjZmEtNDkwMy04NDAzLTU0MDQ2N2I1YTA4ZA.jpg');
INSERT INTO users (id, name, username, password, bio, picture) VALUES (25, 'Michael Hernandez', 'mikehern', 'hanabi', '1st turn invade Australia.  2nd turn win', 'https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAAKuAAAAJDQxMDgwYWYwLTdjZmEtNDkwMy04NDAzLTU0MDQ2N2I1YTA4ZA.jpg');
INSERT INTO users (id, name, username, password, bio, picture) VALUES (26, 'Nicholas Morrow', 'nick', 'cody', 'I like dogs', 'https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAAKuAAAAJDQxMDgwYWYwLTdjZmEtNDkwMy04NDAzLTU0MDQ2N2I1YTA4ZA.jpg');
INSERT INTO users (id, name, username, password, bio, picture) VALUES (27, 'Phoebe Mei', 'sk1', 'faker', 'Do you even CSS?', 'https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAAKuAAAAJDQxMDgwYWYwLTdjZmEtNDkwMy04NDAzLTU0MDQ2N2I1YTA4ZA.jpg');
INSERT INTO users (id, name, username, password, bio, picture) VALUES (28, 'Rithnarin Kong', 'evilspirit', 'poetry', 'Shakespeare inspires me', 'https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAAKuAAAAJDQxMDgwYWYwLTdjZmEtNDkwMy04NDAzLTU0MDQ2N2I1YTA4ZA.jpg');
INSERT INTO users (id, name, username, password, bio, picture) VALUES (29, 'Sean Kang', 'sean', 'rsefa', 'I like 떡볶이', 'https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAAKuAAAAJDQxMDgwYWYwLTdjZmEtNDkwMy04NDAzLTU0MDQ2N2I1YTA4ZA.jpg');
INSERT INTO users (id, name, username, password, bio, picture) VALUES (30, 'Vinoj Govinthasamy', 'vinoj', 'zyxwv', 'Someday, terminators will take over the Earth.  I am working towards that day', 'https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAAKuAAAAJDQxMDgwYWYwLTdjZmEtNDkwMy04NDAzLTU0MDQ2N2I1YTA4ZA.jpg');
INSERT INTO users (id, name, username, password, bio, picture) VALUES (31, 'William Gross', 'rudyred', 'hockey', 'Did you know you cant put 4 of the same characters in a row in a Roman Numeral?', 'https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAAKuAAAAJDQxMDgwYWYwLTdjZmEtNDkwMy04NDAzLTU0MDQ2N2I1YTA4ZA.jpg');


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nogosolo
--

SELECT pg_catalog.setval('users_id_seq', 31, true);
--
--
-- SET statement_timeout = 0;
-- SET lock_timeout = 0;
-- SET idle_in_transaction_session_timeout = 0;
-- SET client_encoding = 'UTF8';
-- SET standard_conforming_strings = on;
-- SET check_function_bodies = false;
-- SET client_min_messages = warning;
-- SET row_security = off;
--
-- SET search_path = public, pg_catalog;
--


INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (2, 'k7vGFfipwcSyV', 'ODESZA: 2017 A Moment Apart Tour on 2017-12-15at Barclays Center');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (2, 'vv170ZfsGkDtRz5l', 'Big Gigantic on 2017-12-01at The Wiltern');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (2, 'G5vYZfsURXkZN', 'NGHTMRE on 2017-12-16at Bill Graham Civic Auditorium');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (2, 'Z7r9jZ1AeF6_3', 'Zhu on 2017-12-31at 1015 Folsom');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (2, '16dbZfVG_G7VQ-R', 'Kendrick Lamar - Platinum on 2018-02-11at The SSE Hydro');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (2, 'vv1A6ZAuIGkdQqAAh', 'Drake Night - Drake Vs His Ex-girlfriends on 2018-01-26at Stage Door');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (2, 'G5vYZfYlQXFZ3', 'Louis The Child: Last to Leave Tour on 2017-12-09at Fox Theater - Oakland');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (2, '1Ae0ZfSGkVEpdjl', 'Rezz on 2017-12-13at The Observatory');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (1, 'k7vGFfipwcSyV', 'ODESZA: 2017 A Moment Apart Tour on 2017-12-15at Barclays Center');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (1, 'vv170ZfsGkDtRz5l', 'Big Gigantic on 2017-12-01at The Wiltern');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (3, 'G5vYZfsURXkZN', 'NGHTMRE on 2017-12-16at Bill Graham Civic Auditorium');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (3, 'Z7r9jZ1AeF6_3', 'Zhu on 2017-12-31at 1015 Folsom');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (4, '16dbZfVG_G7VQ-R', 'Kendrick Lamar - Platinum on 2018-02-11at The SSE Hydro');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (4, 'vv1A6ZAuIGkdQqAAh', 'Drake Night - Drake Vs His Ex-girlfriends on 2018-01-26at Stage Door');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (5, 'G5vYZfYlQXFZ3', 'Louis The Child: Last to Leave Tour on 2017-12-09at Fox Theater - Oakland');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (5, '1Ae0ZfSGkVEpdjl', 'Rezz on 2017-12-13at The Observatory');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (6, 'k7vGFfipwcSyV', 'ODESZA: 2017 A Moment Apart Tour on 2017-12-15at Barclays Center');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (7, 'vv170ZfsGkDtRz5l', 'Big Gigantic on 2017-12-01at The Wiltern');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (7, 'G5vYZfsURXkZN', 'NGHTMRE on 2017-12-16at Bill Graham Civic Auditorium');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (7, 'Z7r9jZ1AeF6_3', 'Zhu on 2017-12-31at 1015 Folsom');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (7, '16dbZfVG_G7VQ-R', 'Kendrick Lamar - Platinum on 2018-02-11at The SSE Hydro');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (8, 'vv1A6ZAuIGkdQqAAh', 'Drake Night - Drake Vs His Ex-girlfriends on 2018-01-26at Stage Door');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (8, 'G5vYZfYlQXFZ3', 'Louis The Child: Last to Leave Tour on 2017-12-09at Fox Theater - Oakland');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (8, '1Ae0ZfSGkVEpdjl', 'Rezz on 2017-12-13at The Observatory');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (9, 'k7vGFfipwcSyV', 'ODESZA: 2017 A Moment Apart Tour on 2017-12-15at Barclays Center');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (10, 'vv170ZfsGkDtRz5l', 'Big Gigantic on 2017-12-01at The Wiltern');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (10, 'G5vYZfsURXkZN', 'NGHTMRE on 2017-12-16at Bill Graham Civic Auditorium');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (10, 'Z7r9jZ1AeF6_3', 'Zhu on 2017-12-31at 1015 Folsom');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (11, '16dbZfVG_G7VQ-R', 'Kendrick Lamar - Platinum on 2018-02-11at The SSE Hydro');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (12, 'vv1A6ZAuIGkdQqAAh', 'Drake Night - Drake Vs His Ex-girlfriends on 2018-01-26at Stage Door');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (12, 'G5vYZfYlQXFZ3', 'Louis The Child: Last to Leave Tour on 2017-12-09at Fox Theater - Oakland');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (12, '1Ae0ZfSGkVEpdjl', 'Rezz on 2017-12-13at The Observatory');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (12, 'k7vGFfipwcSyV', 'ODESZA: 2017 A Moment Apart Tour on 2017-12-15at Barclays Center');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (13, 'vv170ZfsGkDtRz5l', 'Big Gigantic on 2017-12-01at The Wiltern');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (13, 'G5vYZfsURXkZN', 'NGHTMRE on 2017-12-16at Bill Graham Civic Auditorium');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (13, 'Z7r9jZ1AeF6_3', 'Zhu on 2017-12-31at 1015 Folsom');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (13, '16dbZfVG_G7VQ-R', 'Kendrick Lamar - Platinum on 2018-02-11at The SSE Hydro');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (14, 'vv1A6ZAuIGkdQqAAh', 'Drake Night - Drake Vs His Ex-girlfriends on 2018-01-26at Stage Door');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (14, 'G5vYZfYlQXFZ3', 'Louis The Child: Last to Leave Tour on 2017-12-09at Fox Theater - Oakland');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (15, '1Ae0ZfSGkVEpdjl', 'Rezz on 2017-12-13at The Observatory');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (16, 'k7vGFfipwcSyV', 'ODESZA: 2017 A Moment Apart Tour on 2017-12-15at Barclays Center');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (17, 'vv170ZfsGkDtRz5l', 'Big Gigantic on 2017-12-01at The Wiltern');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (17, 'G5vYZfsURXkZN', 'NGHTMRE on 2017-12-16at Bill Graham Civic Auditorium');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (17, 'Z7r9jZ1AeF6_3', 'Zhu on 2017-12-31at 1015 Folsom');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (18, '16dbZfVG_G7VQ-R', 'Kendrick Lamar - Platinum on 2018-02-11at The SSE Hydro');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (18, 'vv1A6ZAuIGkdQqAAh', 'Drake Night - Drake Vs His Ex-girlfriends on 2018-01-26at Stage Door');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (18, 'G5vYZfYlQXFZ3', 'Louis The Child: Last to Leave Tour on 2017-12-09at Fox Theater - Oakland');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (18, '1Ae0ZfSGkVEpdjl', 'Rezz on 2017-12-13at The Observatory');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (19, 'k7vGFfipwcSyV', 'ODESZA: 2017 A Moment Apart Tour on 2017-12-15at Barclays Center');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (19, 'vv170ZfsGkDtRz5l', 'Big Gigantic on 2017-12-01at The Wiltern');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (20, 'G5vYZfsURXkZN', 'NGHTMRE on 2017-12-16at Bill Graham Civic Auditorium');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (20, 'Z7r9jZ1AeF6_3', 'Zhu on 2017-12-31at 1015 Folsom');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (20, '16dbZfVG_G7VQ-R', 'Kendrick Lamar - Platinum on 2018-02-11at The SSE Hydro');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (21, 'vv1A6ZAuIGkdQqAAh', 'Drake Night - Drake Vs His Ex-girlfriends on 2018-01-26at Stage Door');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (21, 'G5vYZfYlQXFZ3', 'Louis The Child: Last to Leave Tour on 2017-12-09at Fox Theater - Oakland');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (21, '1Ae0ZfSGkVEpdjl', 'Rezz on 2017-12-13at The Observatory');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (21, 'k7vGFfipwcSyV', 'ODESZA: 2017 A Moment Apart Tour on 2017-12-15at Barclays Center');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (21, 'vv170ZfsGkDtRz5l', 'Big Gigantic on 2017-12-01at The Wiltern');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (22, 'G5vYZfsURXkZN', 'NGHTMRE on 2017-12-16at Bill Graham Civic Auditorium');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (23, 'Z7r9jZ1AeF6_3', 'Zhu on 2017-12-31at 1015 Folsom');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (23, '16dbZfVG_G7VQ-R', 'Kendrick Lamar - Platinum on 2018-02-11at The SSE Hydro');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (23, 'vv1A6ZAuIGkdQqAAh', 'Drake Night - Drake Vs His Ex-girlfriends on 2018-01-26at Stage Door');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (23, 'G5vYZfYlQXFZ3', 'Louis The Child: Last to Leave Tour on 2017-12-09at Fox Theater - Oakland');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (24, '1Ae0ZfSGkVEpdjl', 'Rezz on 2017-12-13at The Observatory');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (24, 'k7vGFfipwcSyV', 'ODESZA: 2017 A Moment Apart Tour on 2017-12-15at Barclays Center');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (24, 'vv170ZfsGkDtRz5l', 'Big Gigantic on 2017-12-01at The Wiltern');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (24, 'G5vYZfsURXkZN', 'NGHTMRE on 2017-12-16at Bill Graham Civic Auditorium');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (25, 'Z7r9jZ1AeF6_3', 'Zhu on 2017-12-31at 1015 Folsom');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (25, '16dbZfVG_G7VQ-R', 'Kendrick Lamar - Platinum on 2018-02-11at The SSE Hydro');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (26, 'vv1A6ZAuIGkdQqAAh', 'Drake Night - Drake Vs His Ex-girlfriends on 2018-01-26at Stage Door');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (26, 'G5vYZfYlQXFZ3', 'Louis The Child: Last to Leave Tour on 2017-12-09at Fox Theater - Oakland');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (27, '1Ae0ZfSGkVEpdjl', 'Rezz on 2017-12-13at The Observatory');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (27, 'k7vGFfipwcSyV', 'ODESZA: 2017 A Moment Apart Tour on 2017-12-15at Barclays Center');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (27, 'vv170ZfsGkDtRz5l', 'Big Gigantic on 2017-12-01at The Wiltern');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (27, 'G5vYZfsURXkZN', 'NGHTMRE on 2017-12-16at Bill Graham Civic Auditorium');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (27, 'Z7r9jZ1AeF6_3', 'Zhu on 2017-12-31at 1015 Folsom');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (28, '16dbZfVG_G7VQ-R', 'Kendrick Lamar - Platinum on 2018-02-11at The SSE Hydro');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (29, 'vv1A6ZAuIGkdQqAAh', 'Drake Night - Drake Vs His Ex-girlfriends on 2018-01-26at Stage Door');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (29, 'G5vYZfYlQXFZ3', 'Louis The Child: Last to Leave Tour on 2017-12-09at Fox Theater - Oakland');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (29, '1Ae0ZfSGkVEpdjl', 'Rezz on 2017-12-13at The Observatory');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (30, 'k7vGFfipwcSyV', 'ODESZA: 2017 A Moment Apart Tour on 2017-12-15at Barclays Center');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (30, 'vv170ZfsGkDtRz5l', 'Big Gigantic on 2017-12-01at The Wiltern');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (30, 'G5vYZfsURXkZN', 'NGHTMRE on 2017-12-16at Bill Graham Civic Auditorium');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (31, 'Z7r9jZ1AeF6_3', 'Zhu on 2017-12-31at 1015 Folsom');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (31, 'G5vYZfYlQXFZ3', 'Louis The Child: Last to Leave Tour on 2017-12-09at Fox Theater - Oakland');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (31, '1Ae0ZfSGkVEpdjl', 'Rezz on 2017-12-13at The Observatory');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (31, 'k7vGFfipwcSyV', 'ODESZA: 2017 A Moment Apart Tour on 2017-12-15at Barclays Center');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (31, 'vv170ZfsGkDtRz5l', 'Big Gigantic on 2017-12-01at The Wiltern');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (31, 'G5vYZfsURXkZN', 'NGHTMRE on 2017-12-16at Bill Graham Civic Auditorium');

-- SELECT pg_catalog.setval('users_events_id_seq', 132, true);
