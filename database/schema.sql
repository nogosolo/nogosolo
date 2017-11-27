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
  userId INTEGER NOT NULL REFERENCES users(id),
  eventId VARCHAR(255) NOT NULL,
  eventInfoStr VARCHAR(255) NULL DEFAULT NULL,
  -- date TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE match (
  id SERIAL,
  user1 INTEGER NOT NULL REFERENCES users(id),
  user2 INTEGER NOT NULL REFERENCES users(id),
  status BOOLEAN DEFAULT NULL,
  PRIMARY KEY (id)
);


-- ALTER TABLE users_events ADD FOREIGN KEY (userId) REFERENCES users (id);
-- ALTER TABLE match ADD FOREIGN KEY (user1) REFERENCES users (id);
-- ALTER TABLE match ADD FOREIGN KEY (user2) REFERENCES users (id);
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


INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (2, 'k7vGFfipwcSyV', 'ODESZA: 2017 A Moment Apart Tour on 2017-12-15 at Barclays Center');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (2, 'vv170ZfsGkDtRz5l', 'Big Gigantic on 2017-12-01 at The Wiltern');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (2, 'G5vYZfsURXkZN', 'NGHTMRE on 2017-12-16 at Bill Graham Civic Auditorium');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (2, 'Z7r9jZ1AeF6_3', 'Zhu on 2017-12-31 at 1015 Folsom');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (2, '16dbZfVG_G7VQ-R', 'Kendrick Lamar - Platinum on 2018-02-11 at The SSE Hydro');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (2, 'vv1A6ZAuIGkdQqAAh', 'Drake Night - Drake Vs His Ex-girlfriends on 2018-01-26 at Stage Door');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (2, 'G5vYZfYlQXFZ3', 'Louis The Child: Last to Leave Tour on 2017-12-09 at Fox Theater - Oakland');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (2, '1Ae0ZfSGkVEpdjl', 'Rezz on 2017-12-13 at The Observatory');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (1, 'k7vGFfipwcSyV', 'ODESZA: 2017 A Moment Apart Tour on 2017-12-15 at Barclays Center');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (1, 'vv170ZfsGkDtRz5l', 'Big Gigantic on 2017-12-01 at The Wiltern');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (3, 'G5vYZfsURXkZN', 'NGHTMRE on 2017-12-16 at Bill Graham Civic Auditorium');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (3, 'Z7r9jZ1AeF6_3', 'Zhu on 2017-12-31 at 1015 Folsom');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (4, '16dbZfVG_G7VQ-R', 'Kendrick Lamar - Platinum on 2018-02-11 at The SSE Hydro');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (4, 'vv1A6ZAuIGkdQqAAh', 'Drake Night - Drake Vs His Ex-girlfriends on 2018-01-26 at Stage Door');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (5, 'G5vYZfYlQXFZ3', 'Louis The Child: Last to Leave Tour on 2017-12-09 at Fox Theater - Oakland');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (5, '1Ae0ZfSGkVEpdjl', 'Rezz on 2017-12-13 at The Observatory');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (6, 'k7vGFfipwcSyV', 'ODESZA: 2017 A Moment Apart Tour on 2017-12-15 at Barclays Center');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (7, 'vv170ZfsGkDtRz5l', 'Big Gigantic on 2017-12-01 at The Wiltern');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (7, 'G5vYZfsURXkZN', 'NGHTMRE on 2017-12-16 at Bill Graham Civic Auditorium');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (7, 'Z7r9jZ1AeF6_3', 'Zhu on 2017-12-31 at 1015 Folsom');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (7, '16dbZfVG_G7VQ-R', 'Kendrick Lamar - Platinum on 2018-02-11 at The SSE Hydro');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (8, 'vv1A6ZAuIGkdQqAAh', 'Drake Night - Drake Vs His Ex-girlfriends on 2018-01-26 at Stage Door');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (8, 'G5vYZfYlQXFZ3', 'Louis The Child: Last to Leave Tour on 2017-12-09 at Fox Theater - Oakland');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (8, '1Ae0ZfSGkVEpdjl', 'Rezz on 2017-12-13 at The Observatory');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (9, 'k7vGFfipwcSyV', 'ODESZA: 2017 A Moment Apart Tour on 2017-12-15 at Barclays Center');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (10, 'vv170ZfsGkDtRz5l', 'Big Gigantic on 2017-12-01 at The Wiltern');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (10, 'G5vYZfsURXkZN', 'NGHTMRE on 2017-12-16 at Bill Graham Civic Auditorium');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (10, 'Z7r9jZ1AeF6_3', 'Zhu on 2017-12-31 at 1015 Folsom');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (11, '16dbZfVG_G7VQ-R', 'Kendrick Lamar - Platinum on 2018-02-11 at The SSE Hydro');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (12, 'vv1A6ZAuIGkdQqAAh', 'Drake Night - Drake Vs His Ex-girlfriends on 2018-01-26 at Stage Door');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (12, 'G5vYZfYlQXFZ3', 'Louis The Child: Last to Leave Tour on 2017-12-09 at Fox Theater - Oakland');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (12, '1Ae0ZfSGkVEpdjl', 'Rezz on 2017-12-13 at The Observatory');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (12, 'k7vGFfipwcSyV', 'ODESZA: 2017 A Moment Apart Tour on 2017-12-15 at Barclays Center');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (13, 'vv170ZfsGkDtRz5l', 'Big Gigantic on 2017-12-01 at The Wiltern');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (13, 'G5vYZfsURXkZN', 'NGHTMRE on 2017-12-16 at Bill Graham Civic Auditorium');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (13, 'Z7r9jZ1AeF6_3', 'Zhu on 2017-12-31 at 1015 Folsom');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (13, '16dbZfVG_G7VQ-R', 'Kendrick Lamar - Platinum on 2018-02-11 at The SSE Hydro');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (14, 'vv1A6ZAuIGkdQqAAh', 'Drake Night - Drake Vs His Ex-girlfriends on 2018-01-26 at Stage Door');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (14, 'G5vYZfYlQXFZ3', 'Louis The Child: Last to Leave Tour on 2017-12-09 at Fox Theater - Oakland');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (15, '1Ae0ZfSGkVEpdjl', 'Rezz on 2017-12-13 at The Observatory');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (16, 'k7vGFfipwcSyV', 'ODESZA: 2017 A Moment Apart Tour on 2017-12-15 at Barclays Center');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (17, 'vv170ZfsGkDtRz5l', 'Big Gigantic on 2017-12-01 at The Wiltern');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (17, 'G5vYZfsURXkZN', 'NGHTMRE on 2017-12-16 at Bill Graham Civic Auditorium');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (17, 'Z7r9jZ1AeF6_3', 'Zhu on 2017-12-31 at 1015 Folsom');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (18, '16dbZfVG_G7VQ-R', 'Kendrick Lamar - Platinum on 2018-02-11 at The SSE Hydro');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (18, 'vv1A6ZAuIGkdQqAAh', 'Drake Night - Drake Vs His Ex-girlfriends on 2018-01-26 at Stage Door');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (18, 'G5vYZfYlQXFZ3', 'Louis The Child: Last to Leave Tour on 2017-12-09 at Fox Theater - Oakland');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (18, '1Ae0ZfSGkVEpdjl', 'Rezz on 2017-12-13 at The Observatory');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (19, 'k7vGFfipwcSyV', 'ODESZA: 2017 A Moment Apart Tour on 2017-12-15 at Barclays Center');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (19, 'vv170ZfsGkDtRz5l', 'Big Gigantic on 2017-12-01 at The Wiltern');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (20, 'G5vYZfsURXkZN', 'NGHTMRE on 2017-12-16 at Bill Graham Civic Auditorium');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (20, 'Z7r9jZ1AeF6_3', 'Zhu on 2017-12-31 at 1015 Folsom');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (20, '16dbZfVG_G7VQ-R', 'Kendrick Lamar - Platinum on 2018-02-11 at The SSE Hydro');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (21, 'vv1A6ZAuIGkdQqAAh', 'Drake Night - Drake Vs His Ex-girlfriends on 2018-01-26 at Stage Door');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (21, 'G5vYZfYlQXFZ3', 'Louis The Child: Last to Leave Tour on 2017-12-09 at Fox Theater - Oakland');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (21, '1Ae0ZfSGkVEpdjl', 'Rezz on 2017-12-13 at The Observatory');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (21, 'k7vGFfipwcSyV', 'ODESZA: 2017 A Moment Apart Tour on 2017-12-15 at Barclays Center');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (21, 'vv170ZfsGkDtRz5l', 'Big Gigantic on 2017-12-01 at The Wiltern');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (22, 'G5vYZfsURXkZN', 'NGHTMRE on 2017-12-16 at Bill Graham Civic Auditorium');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (23, 'Z7r9jZ1AeF6_3', 'Zhu on 2017-12-31 at 1015 Folsom');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (23, '16dbZfVG_G7VQ-R', 'Kendrick Lamar - Platinum on 2018-02-11 at The SSE Hydro');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (23, 'vv1A6ZAuIGkdQqAAh', 'Drake Night - Drake Vs His Ex-girlfriends on 2018-01-26 at Stage Door');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (23, 'G5vYZfYlQXFZ3', 'Louis The Child: Last to Leave Tour on 2017-12-09 at Fox Theater - Oakland');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (24, '1Ae0ZfSGkVEpdjl', 'Rezz on 2017-12-13 at The Observatory');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (24, 'k7vGFfipwcSyV', 'ODESZA: 2017 A Moment Apart Tour on 2017-12-15 at Barclays Center');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (24, 'vv170ZfsGkDtRz5l', 'Big Gigantic on 2017-12-01 at The Wiltern');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (24, 'G5vYZfsURXkZN', 'NGHTMRE on 2017-12-16 at Bill Graham Civic Auditorium');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (25, 'Z7r9jZ1AeF6_3', 'Zhu on 2017-12-31 at 1015 Folsom');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (25, '16dbZfVG_G7VQ-R', 'Kendrick Lamar - Platinum on 2018-02-11 at The SSE Hydro');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (26, 'vv1A6ZAuIGkdQqAAh', 'Drake Night - Drake Vs His Ex-girlfriends on 2018-01-26 at Stage Door');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (26, 'G5vYZfYlQXFZ3', 'Louis The Child: Last to Leave Tour on 2017-12-09 at Fox Theater - Oakland');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (27, '1Ae0ZfSGkVEpdjl', 'Rezz on 2017-12-13 at The Observatory');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (27, 'k7vGFfipwcSyV', 'ODESZA: 2017 A Moment Apart Tour on 2017-12-15 at Barclays Center');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (27, 'vv170ZfsGkDtRz5l', 'Big Gigantic on 2017-12-01 at The Wiltern');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (27, 'G5vYZfsURXkZN', 'NGHTMRE on 2017-12-16 at Bill Graham Civic Auditorium');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (27, 'Z7r9jZ1AeF6_3', 'Zhu on 2017-12-31 at 1015 Folsom');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (28, '16dbZfVG_G7VQ-R', 'Kendrick Lamar - Platinum on 2018-02-11 at The SSE Hydro');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (29, 'vv1A6ZAuIGkdQqAAh', 'Drake Night - Drake Vs His Ex-girlfriends on 2018-01-26 at Stage Door');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (29, 'G5vYZfYlQXFZ3', 'Louis The Child: Last to Leave Tour on 2017-12-09 at Fox Theater - Oakland');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (29, '1Ae0ZfSGkVEpdjl', 'Rezz on 2017-12-13 at The Observatory');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (30, 'k7vGFfipwcSyV', 'ODESZA: 2017 A Moment Apart Tour on 2017-12-15 at Barclays Center');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (30, 'vv170ZfsGkDtRz5l', 'Big Gigantic on 2017-12-01 at The Wiltern');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (30, 'G5vYZfsURXkZN', 'NGHTMRE on 2017-12-16 at Bill Graham Civic Auditorium');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (31, 'Z7r9jZ1AeF6_3', 'Zhu on 2017-12-31 at 1015 Folsom');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (31, 'G5vYZfYlQXFZ3', 'Louis The Child: Last to Leave Tour on 2017-12-09 at Fox Theater - Oakland');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (31, '1Ae0ZfSGkVEpdjl', 'Rezz on 2017-12-13 at The Observatory');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (31, 'k7vGFfipwcSyV', 'ODESZA: 2017 A Moment Apart Tour on 2017-12-15 at Barclays Center');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (31, 'vv170ZfsGkDtRz5l', 'Big Gigantic on 2017-12-01 at The Wiltern');
INSERT INTO users_events (userid, eventid, eventinfostr) VALUES (31, 'G5vYZfsURXkZN', 'NGHTMRE on 2017-12-16 at Bill Graham Civic Auditorium');

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

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
-- Data for Name: match; Type: TABLE DATA; Schema: public; Owner: nogosolo
--

INSERT INTO match (user1, user2, status) VALUES (1, 2, NULL);
INSERT INTO match (user1, user2, status) VALUES (1, 6, NULL);
INSERT INTO match (user1, user2, status) VALUES (1, 7, NULL);
INSERT INTO match (user1, user2, status) VALUES (1, 9, NULL);
INSERT INTO match (user1, user2, status) VALUES (1, 10, NULL);
INSERT INTO match (user1, user2, status) VALUES (1, 12, NULL);
INSERT INTO match (user1, user2, status) VALUES (1, 13, NULL);
INSERT INTO match (user1, user2, status) VALUES (1, 16, NULL);
INSERT INTO match (user1, user2, status) VALUES (1, 17, NULL);
INSERT INTO match (user1, user2, status) VALUES (1, 19, NULL);
INSERT INTO match (user1, user2, status) VALUES (1, 21, NULL);
INSERT INTO match (user1, user2, status) VALUES (1, 24, NULL);
INSERT INTO match (user1, user2, status) VALUES (1, 27, NULL);
INSERT INTO match (user1, user2, status) VALUES (1, 30, NULL);
INSERT INTO match (user1, user2, status) VALUES (1, 31, NULL);
INSERT INTO match (user1, user2, status) VALUES (2, 1, true);
INSERT INTO match (user1, user2, status) VALUES (2, 3, true);
INSERT INTO match (user1, user2, status) VALUES (2, 4, true);
INSERT INTO match (user1, user2, status) VALUES (2, 5, true);
INSERT INTO match (user1, user2, status) VALUES (2, 6, true);
INSERT INTO match (user1, user2, status) VALUES (2, 7, true);
INSERT INTO match (user1, user2, status) VALUES (2, 8, true);
INSERT INTO match (user1, user2, status) VALUES (2, 9, true);
INSERT INTO match (user1, user2, status) VALUES (2, 10, true);
INSERT INTO match (user1, user2, status) VALUES (2, 11, true);
INSERT INTO match (user1, user2, status) VALUES (2, 12, true);
INSERT INTO match (user1, user2, status) VALUES (2, 13, true);
INSERT INTO match (user1, user2, status) VALUES (2, 14, true);
INSERT INTO match (user1, user2, status) VALUES (2, 15, true);
INSERT INTO match (user1, user2, status) VALUES (2, 16, true);
INSERT INTO match (user1, user2, status) VALUES (2, 17, true);
INSERT INTO match (user1, user2, status) VALUES (2, 18, true);
INSERT INTO match (user1, user2, status) VALUES (2, 19, true);
INSERT INTO match (user1, user2, status) VALUES (2, 20, true);
INSERT INTO match (user1, user2, status) VALUES (2, 21, true);
INSERT INTO match (user1, user2, status) VALUES (2, 22, true);
INSERT INTO match (user1, user2, status) VALUES (2, 23, true);
INSERT INTO match (user1, user2, status) VALUES (2, 24, true);
INSERT INTO match (user1, user2, status) VALUES (2, 25, true);
INSERT INTO match (user1, user2, status) VALUES (2, 26, true);
INSERT INTO match (user1, user2, status) VALUES (2, 27, true);
INSERT INTO match (user1, user2, status) VALUES (2, 28, true);
INSERT INTO match (user1, user2, status) VALUES (2, 29, true);
INSERT INTO match (user1, user2, status) VALUES (2, 30, true);
INSERT INTO match (user1, user2, status) VALUES (2, 31, true);
INSERT INTO match (user1, user2, status) VALUES (3, 2, NULL);
INSERT INTO match (user1, user2, status) VALUES (3, 7, NULL);
INSERT INTO match (user1, user2, status) VALUES (3, 10, NULL);
INSERT INTO match (user1, user2, status) VALUES (3, 13, NULL);
INSERT INTO match (user1, user2, status) VALUES (3, 17, NULL);
INSERT INTO match (user1, user2, status) VALUES (3, 20, NULL);
INSERT INTO match (user1, user2, status) VALUES (3, 22, NULL);
INSERT INTO match (user1, user2, status) VALUES (3, 23, NULL);
INSERT INTO match (user1, user2, status) VALUES (3, 24, NULL);
INSERT INTO match (user1, user2, status) VALUES (3, 25, NULL);
INSERT INTO match (user1, user2, status) VALUES (3, 27, NULL);
INSERT INTO match (user1, user2, status) VALUES (3, 30, NULL);
INSERT INTO match (user1, user2, status) VALUES (3, 31, NULL);
INSERT INTO match (user1, user2, status) VALUES (4, 2, NULL);
INSERT INTO match (user1, user2, status) VALUES (4, 7, NULL);
INSERT INTO match (user1, user2, status) VALUES (4, 8, NULL);
INSERT INTO match (user1, user2, status) VALUES (4, 11, NULL);
INSERT INTO match (user1, user2, status) VALUES (4, 12, NULL);
INSERT INTO match (user1, user2, status) VALUES (4, 13, NULL);
INSERT INTO match (user1, user2, status) VALUES (4, 14, NULL);
INSERT INTO match (user1, user2, status) VALUES (4, 18, NULL);
INSERT INTO match (user1, user2, status) VALUES (4, 20, NULL);
INSERT INTO match (user1, user2, status) VALUES (4, 21, NULL);
INSERT INTO match (user1, user2, status) VALUES (4, 23, NULL);
INSERT INTO match (user1, user2, status) VALUES (4, 25, NULL);
INSERT INTO match (user1, user2, status) VALUES (4, 26, NULL);
INSERT INTO match (user1, user2, status) VALUES (4, 28, NULL);
INSERT INTO match (user1, user2, status) VALUES (4, 29, NULL);
INSERT INTO match (user1, user2, status) VALUES (5, 2, NULL);
INSERT INTO match (user1, user2, status) VALUES (5, 8, NULL);
INSERT INTO match (user1, user2, status) VALUES (5, 12, NULL);
INSERT INTO match (user1, user2, status) VALUES (5, 14, NULL);
INSERT INTO match (user1, user2, status) VALUES (5, 15, NULL);
INSERT INTO match (user1, user2, status) VALUES (5, 18, NULL);
INSERT INTO match (user1, user2, status) VALUES (5, 21, NULL);
INSERT INTO match (user1, user2, status) VALUES (5, 23, NULL);
INSERT INTO match (user1, user2, status) VALUES (5, 24, NULL);
INSERT INTO match (user1, user2, status) VALUES (5, 26, NULL);
INSERT INTO match (user1, user2, status) VALUES (5, 27, NULL);
INSERT INTO match (user1, user2, status) VALUES (5, 29, NULL);
INSERT INTO match (user1, user2, status) VALUES (5, 31, NULL);
INSERT INTO match (user1, user2, status) VALUES (6, 1, NULL);
INSERT INTO match (user1, user2, status) VALUES (6, 2, NULL);
INSERT INTO match (user1, user2, status) VALUES (6, 9, NULL);
INSERT INTO match (user1, user2, status) VALUES (6, 12, NULL);
INSERT INTO match (user1, user2, status) VALUES (6, 16, NULL);
INSERT INTO match (user1, user2, status) VALUES (6, 19, NULL);
INSERT INTO match (user1, user2, status) VALUES (6, 21, NULL);
INSERT INTO match (user1, user2, status) VALUES (6, 24, NULL);
INSERT INTO match (user1, user2, status) VALUES (6, 27, NULL);
INSERT INTO match (user1, user2, status) VALUES (6, 30, NULL);
INSERT INTO match (user1, user2, status) VALUES (6, 31, NULL);
INSERT INTO match (user1, user2, status) VALUES (7, 1, NULL);
INSERT INTO match (user1, user2, status) VALUES (7, 2, NULL);
INSERT INTO match (user1, user2, status) VALUES (7, 3, NULL);
INSERT INTO match (user1, user2, status) VALUES (7, 4, NULL);
INSERT INTO match (user1, user2, status) VALUES (7, 10, NULL);
INSERT INTO match (user1, user2, status) VALUES (7, 11, NULL);
INSERT INTO match (user1, user2, status) VALUES (7, 13, NULL);
INSERT INTO match (user1, user2, status) VALUES (7, 17, NULL);
INSERT INTO match (user1, user2, status) VALUES (7, 18, NULL);
INSERT INTO match (user1, user2, status) VALUES (7, 19, NULL);
INSERT INTO match (user1, user2, status) VALUES (7, 20, NULL);
INSERT INTO match (user1, user2, status) VALUES (7, 21, NULL);
INSERT INTO match (user1, user2, status) VALUES (7, 22, NULL);
INSERT INTO match (user1, user2, status) VALUES (7, 23, NULL);
INSERT INTO match (user1, user2, status) VALUES (7, 24, NULL);
INSERT INTO match (user1, user2, status) VALUES (7, 25, NULL);
INSERT INTO match (user1, user2, status) VALUES (7, 27, NULL);
INSERT INTO match (user1, user2, status) VALUES (7, 28, NULL);
INSERT INTO match (user1, user2, status) VALUES (7, 30, NULL);
INSERT INTO match (user1, user2, status) VALUES (7, 31, NULL);
INSERT INTO match (user1, user2, status) VALUES (8, 2, NULL);
INSERT INTO match (user1, user2, status) VALUES (8, 4, NULL);
INSERT INTO match (user1, user2, status) VALUES (8, 5, NULL);
INSERT INTO match (user1, user2, status) VALUES (8, 12, NULL);
INSERT INTO match (user1, user2, status) VALUES (8, 14, NULL);
INSERT INTO match (user1, user2, status) VALUES (8, 15, NULL);
INSERT INTO match (user1, user2, status) VALUES (8, 18, NULL);
INSERT INTO match (user1, user2, status) VALUES (8, 21, NULL);
INSERT INTO match (user1, user2, status) VALUES (8, 23, NULL);
INSERT INTO match (user1, user2, status) VALUES (8, 24, NULL);
INSERT INTO match (user1, user2, status) VALUES (8, 26, NULL);
INSERT INTO match (user1, user2, status) VALUES (8, 27, NULL);
INSERT INTO match (user1, user2, status) VALUES (8, 29, NULL);
INSERT INTO match (user1, user2, status) VALUES (8, 31, NULL);
INSERT INTO match (user1, user2, status) VALUES (9, 1, NULL);
INSERT INTO match (user1, user2, status) VALUES (9, 2, NULL);
INSERT INTO match (user1, user2, status) VALUES (9, 6, NULL);
INSERT INTO match (user1, user2, status) VALUES (9, 12, NULL);
INSERT INTO match (user1, user2, status) VALUES (9, 16, NULL);
INSERT INTO match (user1, user2, status) VALUES (9, 19, NULL);
INSERT INTO match (user1, user2, status) VALUES (9, 21, NULL);
INSERT INTO match (user1, user2, status) VALUES (9, 24, NULL);
INSERT INTO match (user1, user2, status) VALUES (9, 27, NULL);
INSERT INTO match (user1, user2, status) VALUES (9, 30, NULL);
INSERT INTO match (user1, user2, status) VALUES (9, 31, NULL);
INSERT INTO match (user1, user2, status) VALUES (10, 1, NULL);
INSERT INTO match (user1, user2, status) VALUES (10, 2, NULL);
INSERT INTO match (user1, user2, status) VALUES (10, 3, NULL);
INSERT INTO match (user1, user2, status) VALUES (10, 7, NULL);
INSERT INTO match (user1, user2, status) VALUES (10, 13, NULL);
INSERT INTO match (user1, user2, status) VALUES (10, 17, NULL);
INSERT INTO match (user1, user2, status) VALUES (10, 19, NULL);
INSERT INTO match (user1, user2, status) VALUES (10, 20, NULL);
INSERT INTO match (user1, user2, status) VALUES (10, 21, NULL);
INSERT INTO match (user1, user2, status) VALUES (10, 22, NULL);
INSERT INTO match (user1, user2, status) VALUES (10, 23, NULL);
INSERT INTO match (user1, user2, status) VALUES (10, 24, NULL);
INSERT INTO match (user1, user2, status) VALUES (10, 25, NULL);
INSERT INTO match (user1, user2, status) VALUES (10, 27, NULL);
INSERT INTO match (user1, user2, status) VALUES (10, 30, NULL);
INSERT INTO match (user1, user2, status) VALUES (10, 31, NULL);
INSERT INTO match (user1, user2, status) VALUES (11, 2, NULL);
INSERT INTO match (user1, user2, status) VALUES (11, 4, NULL);
INSERT INTO match (user1, user2, status) VALUES (11, 7, NULL);
INSERT INTO match (user1, user2, status) VALUES (11, 13, NULL);
INSERT INTO match (user1, user2, status) VALUES (11, 18, NULL);
INSERT INTO match (user1, user2, status) VALUES (11, 20, NULL);
INSERT INTO match (user1, user2, status) VALUES (11, 23, NULL);
INSERT INTO match (user1, user2, status) VALUES (11, 25, NULL);
INSERT INTO match (user1, user2, status) VALUES (11, 28, NULL);
INSERT INTO match (user1, user2, status) VALUES (12, 1, NULL);
INSERT INTO match (user1, user2, status) VALUES (12, 2, NULL);
INSERT INTO match (user1, user2, status) VALUES (12, 4, NULL);
INSERT INTO match (user1, user2, status) VALUES (12, 5, NULL);
INSERT INTO match (user1, user2, status) VALUES (12, 6, NULL);
INSERT INTO match (user1, user2, status) VALUES (12, 8, NULL);
INSERT INTO match (user1, user2, status) VALUES (12, 9, NULL);
INSERT INTO match (user1, user2, status) VALUES (12, 14, NULL);
INSERT INTO match (user1, user2, status) VALUES (12, 15, NULL);
INSERT INTO match (user1, user2, status) VALUES (12, 16, NULL);
INSERT INTO match (user1, user2, status) VALUES (12, 18, NULL);
INSERT INTO match (user1, user2, status) VALUES (12, 19, NULL);
INSERT INTO match (user1, user2, status) VALUES (12, 21, NULL);
INSERT INTO match (user1, user2, status) VALUES (12, 23, NULL);
INSERT INTO match (user1, user2, status) VALUES (12, 24, NULL);
INSERT INTO match (user1, user2, status) VALUES (12, 26, NULL);
INSERT INTO match (user1, user2, status) VALUES (12, 27, NULL);
INSERT INTO match (user1, user2, status) VALUES (12, 29, NULL);
INSERT INTO match (user1, user2, status) VALUES (12, 30, NULL);
INSERT INTO match (user1, user2, status) VALUES (12, 31, NULL);
INSERT INTO match (user1, user2, status) VALUES (13, 1, NULL);
INSERT INTO match (user1, user2, status) VALUES (13, 2, NULL);
INSERT INTO match (user1, user2, status) VALUES (13, 3, NULL);
INSERT INTO match (user1, user2, status) VALUES (13, 4, NULL);
INSERT INTO match (user1, user2, status) VALUES (13, 7, NULL);
INSERT INTO match (user1, user2, status) VALUES (13, 10, NULL);
INSERT INTO match (user1, user2, status) VALUES (13, 11, NULL);
INSERT INTO match (user1, user2, status) VALUES (13, 17, NULL);
INSERT INTO match (user1, user2, status) VALUES (13, 18, NULL);
INSERT INTO match (user1, user2, status) VALUES (13, 19, NULL);
INSERT INTO match (user1, user2, status) VALUES (13, 20, NULL);
INSERT INTO match (user1, user2, status) VALUES (13, 21, NULL);
INSERT INTO match (user1, user2, status) VALUES (13, 22, NULL);
INSERT INTO match (user1, user2, status) VALUES (13, 23, NULL);
INSERT INTO match (user1, user2, status) VALUES (13, 24, NULL);
INSERT INTO match (user1, user2, status) VALUES (13, 25, NULL);
INSERT INTO match (user1, user2, status) VALUES (13, 27, NULL);
INSERT INTO match (user1, user2, status) VALUES (13, 28, NULL);
INSERT INTO match (user1, user2, status) VALUES (13, 30, NULL);
INSERT INTO match (user1, user2, status) VALUES (13, 31, NULL);
INSERT INTO match (user1, user2, status) VALUES (14, 2, NULL);
INSERT INTO match (user1, user2, status) VALUES (14, 4, NULL);
INSERT INTO match (user1, user2, status) VALUES (14, 5, NULL);
INSERT INTO match (user1, user2, status) VALUES (14, 8, NULL);
INSERT INTO match (user1, user2, status) VALUES (14, 12, NULL);
INSERT INTO match (user1, user2, status) VALUES (14, 18, NULL);
INSERT INTO match (user1, user2, status) VALUES (14, 21, NULL);
INSERT INTO match (user1, user2, status) VALUES (14, 23, NULL);
INSERT INTO match (user1, user2, status) VALUES (14, 26, NULL);
INSERT INTO match (user1, user2, status) VALUES (14, 29, NULL);
INSERT INTO match (user1, user2, status) VALUES (14, 31, NULL);
INSERT INTO match (user1, user2, status) VALUES (15, 2, NULL);
INSERT INTO match (user1, user2, status) VALUES (15, 5, NULL);
INSERT INTO match (user1, user2, status) VALUES (15, 8, NULL);
INSERT INTO match (user1, user2, status) VALUES (15, 12, NULL);
INSERT INTO match (user1, user2, status) VALUES (15, 18, NULL);
INSERT INTO match (user1, user2, status) VALUES (15, 21, NULL);
INSERT INTO match (user1, user2, status) VALUES (15, 24, NULL);
INSERT INTO match (user1, user2, status) VALUES (15, 27, NULL);
INSERT INTO match (user1, user2, status) VALUES (15, 29, NULL);
INSERT INTO match (user1, user2, status) VALUES (15, 31, NULL);
INSERT INTO match (user1, user2, status) VALUES (16, 1, NULL);
INSERT INTO match (user1, user2, status) VALUES (16, 2, NULL);
INSERT INTO match (user1, user2, status) VALUES (16, 6, NULL);
INSERT INTO match (user1, user2, status) VALUES (16, 9, NULL);
INSERT INTO match (user1, user2, status) VALUES (16, 12, NULL);
INSERT INTO match (user1, user2, status) VALUES (16, 19, NULL);
INSERT INTO match (user1, user2, status) VALUES (16, 21, NULL);
INSERT INTO match (user1, user2, status) VALUES (16, 24, NULL);
INSERT INTO match (user1, user2, status) VALUES (16, 27, NULL);
INSERT INTO match (user1, user2, status) VALUES (16, 30, NULL);
INSERT INTO match (user1, user2, status) VALUES (16, 31, NULL);
INSERT INTO match (user1, user2, status) VALUES (17, 1, NULL);
INSERT INTO match (user1, user2, status) VALUES (17, 2, NULL);
INSERT INTO match (user1, user2, status) VALUES (17, 3, NULL);
INSERT INTO match (user1, user2, status) VALUES (17, 7, NULL);
INSERT INTO match (user1, user2, status) VALUES (17, 10, NULL);
INSERT INTO match (user1, user2, status) VALUES (17, 13, NULL);
INSERT INTO match (user1, user2, status) VALUES (17, 19, NULL);
INSERT INTO match (user1, user2, status) VALUES (17, 20, NULL);
INSERT INTO match (user1, user2, status) VALUES (17, 21, NULL);
INSERT INTO match (user1, user2, status) VALUES (17, 22, NULL);
INSERT INTO match (user1, user2, status) VALUES (17, 23, NULL);
INSERT INTO match (user1, user2, status) VALUES (17, 24, NULL);
INSERT INTO match (user1, user2, status) VALUES (17, 25, NULL);
INSERT INTO match (user1, user2, status) VALUES (17, 27, NULL);
INSERT INTO match (user1, user2, status) VALUES (17, 30, NULL);
INSERT INTO match (user1, user2, status) VALUES (17, 31, NULL);
INSERT INTO match (user1, user2, status) VALUES (18, 2, NULL);
INSERT INTO match (user1, user2, status) VALUES (18, 4, NULL);
INSERT INTO match (user1, user2, status) VALUES (18, 5, NULL);
INSERT INTO match (user1, user2, status) VALUES (18, 7, NULL);
INSERT INTO match (user1, user2, status) VALUES (18, 8, NULL);
INSERT INTO match (user1, user2, status) VALUES (18, 11, NULL);
INSERT INTO match (user1, user2, status) VALUES (18, 12, NULL);
INSERT INTO match (user1, user2, status) VALUES (18, 13, NULL);
INSERT INTO match (user1, user2, status) VALUES (18, 14, NULL);
INSERT INTO match (user1, user2, status) VALUES (18, 15, NULL);
INSERT INTO match (user1, user2, status) VALUES (18, 20, NULL);
INSERT INTO match (user1, user2, status) VALUES (18, 21, NULL);
INSERT INTO match (user1, user2, status) VALUES (18, 23, NULL);
INSERT INTO match (user1, user2, status) VALUES (18, 24, NULL);
INSERT INTO match (user1, user2, status) VALUES (18, 25, NULL);
INSERT INTO match (user1, user2, status) VALUES (18, 26, NULL);
INSERT INTO match (user1, user2, status) VALUES (18, 27, NULL);
INSERT INTO match (user1, user2, status) VALUES (18, 28, NULL);
INSERT INTO match (user1, user2, status) VALUES (18, 29, NULL);
INSERT INTO match (user1, user2, status) VALUES (18, 31, NULL);
INSERT INTO match (user1, user2, status) VALUES (19, 1, NULL);
INSERT INTO match (user1, user2, status) VALUES (19, 2, NULL);
INSERT INTO match (user1, user2, status) VALUES (19, 6, NULL);
INSERT INTO match (user1, user2, status) VALUES (19, 7, NULL);
INSERT INTO match (user1, user2, status) VALUES (19, 9, NULL);
INSERT INTO match (user1, user2, status) VALUES (19, 10, NULL);
INSERT INTO match (user1, user2, status) VALUES (19, 12, NULL);
INSERT INTO match (user1, user2, status) VALUES (19, 13, NULL);
INSERT INTO match (user1, user2, status) VALUES (19, 16, NULL);
INSERT INTO match (user1, user2, status) VALUES (19, 17, NULL);
INSERT INTO match (user1, user2, status) VALUES (19, 21, NULL);
INSERT INTO match (user1, user2, status) VALUES (19, 24, NULL);
INSERT INTO match (user1, user2, status) VALUES (19, 27, NULL);
INSERT INTO match (user1, user2, status) VALUES (19, 30, NULL);
INSERT INTO match (user1, user2, status) VALUES (19, 31, NULL);
INSERT INTO match (user1, user2, status) VALUES (20, 2, NULL);
INSERT INTO match (user1, user2, status) VALUES (20, 3, NULL);
INSERT INTO match (user1, user2, status) VALUES (20, 4, NULL);
INSERT INTO match (user1, user2, status) VALUES (20, 7, NULL);
INSERT INTO match (user1, user2, status) VALUES (20, 10, NULL);
INSERT INTO match (user1, user2, status) VALUES (20, 11, NULL);
INSERT INTO match (user1, user2, status) VALUES (20, 13, NULL);
INSERT INTO match (user1, user2, status) VALUES (20, 17, NULL);
INSERT INTO match (user1, user2, status) VALUES (20, 18, NULL);
INSERT INTO match (user1, user2, status) VALUES (20, 22, NULL);
INSERT INTO match (user1, user2, status) VALUES (20, 23, NULL);
INSERT INTO match (user1, user2, status) VALUES (20, 24, NULL);
INSERT INTO match (user1, user2, status) VALUES (20, 25, NULL);
INSERT INTO match (user1, user2, status) VALUES (20, 27, NULL);
INSERT INTO match (user1, user2, status) VALUES (20, 28, NULL);
INSERT INTO match (user1, user2, status) VALUES (20, 30, NULL);
INSERT INTO match (user1, user2, status) VALUES (20, 31, NULL);
INSERT INTO match (user1, user2, status) VALUES (21, 1, NULL);
INSERT INTO match (user1, user2, status) VALUES (21, 2, NULL);
INSERT INTO match (user1, user2, status) VALUES (21, 4, NULL);
INSERT INTO match (user1, user2, status) VALUES (21, 5, NULL);
INSERT INTO match (user1, user2, status) VALUES (21, 6, NULL);
INSERT INTO match (user1, user2, status) VALUES (21, 7, NULL);
INSERT INTO match (user1, user2, status) VALUES (21, 8, NULL);
INSERT INTO match (user1, user2, status) VALUES (21, 9, NULL);
INSERT INTO match (user1, user2, status) VALUES (21, 10, NULL);
INSERT INTO match (user1, user2, status) VALUES (21, 12, NULL);
INSERT INTO match (user1, user2, status) VALUES (21, 13, NULL);
INSERT INTO match (user1, user2, status) VALUES (21, 14, NULL);
INSERT INTO match (user1, user2, status) VALUES (21, 15, NULL);
INSERT INTO match (user1, user2, status) VALUES (21, 16, NULL);
INSERT INTO match (user1, user2, status) VALUES (21, 17, NULL);
INSERT INTO match (user1, user2, status) VALUES (21, 18, NULL);
INSERT INTO match (user1, user2, status) VALUES (21, 19, NULL);
INSERT INTO match (user1, user2, status) VALUES (21, 23, NULL);
INSERT INTO match (user1, user2, status) VALUES (21, 24, NULL);
INSERT INTO match (user1, user2, status) VALUES (21, 26, NULL);
INSERT INTO match (user1, user2, status) VALUES (21, 27, NULL);
INSERT INTO match (user1, user2, status) VALUES (21, 29, NULL);
INSERT INTO match (user1, user2, status) VALUES (21, 30, NULL);
INSERT INTO match (user1, user2, status) VALUES (21, 31, NULL);
INSERT INTO match (user1, user2, status) VALUES (22, 2, NULL);
INSERT INTO match (user1, user2, status) VALUES (22, 3, NULL);
INSERT INTO match (user1, user2, status) VALUES (22, 7, NULL);
INSERT INTO match (user1, user2, status) VALUES (22, 10, NULL);
INSERT INTO match (user1, user2, status) VALUES (22, 13, NULL);
INSERT INTO match (user1, user2, status) VALUES (22, 17, NULL);
INSERT INTO match (user1, user2, status) VALUES (22, 20, NULL);
INSERT INTO match (user1, user2, status) VALUES (22, 24, NULL);
INSERT INTO match (user1, user2, status) VALUES (22, 27, NULL);
INSERT INTO match (user1, user2, status) VALUES (22, 30, NULL);
INSERT INTO match (user1, user2, status) VALUES (22, 31, NULL);
INSERT INTO match (user1, user2, status) VALUES (23, 2, NULL);
INSERT INTO match (user1, user2, status) VALUES (23, 3, NULL);
INSERT INTO match (user1, user2, status) VALUES (23, 4, NULL);
INSERT INTO match (user1, user2, status) VALUES (23, 5, NULL);
INSERT INTO match (user1, user2, status) VALUES (23, 7, NULL);
INSERT INTO match (user1, user2, status) VALUES (23, 8, NULL);
INSERT INTO match (user1, user2, status) VALUES (23, 10, NULL);
INSERT INTO match (user1, user2, status) VALUES (23, 11, NULL);
INSERT INTO match (user1, user2, status) VALUES (23, 12, NULL);
INSERT INTO match (user1, user2, status) VALUES (23, 13, NULL);
INSERT INTO match (user1, user2, status) VALUES (23, 14, NULL);
INSERT INTO match (user1, user2, status) VALUES (23, 17, NULL);
INSERT INTO match (user1, user2, status) VALUES (23, 18, NULL);
INSERT INTO match (user1, user2, status) VALUES (23, 20, NULL);
INSERT INTO match (user1, user2, status) VALUES (23, 21, NULL);
INSERT INTO match (user1, user2, status) VALUES (23, 25, NULL);
INSERT INTO match (user1, user2, status) VALUES (23, 26, NULL);
INSERT INTO match (user1, user2, status) VALUES (23, 27, NULL);
INSERT INTO match (user1, user2, status) VALUES (23, 28, NULL);
INSERT INTO match (user1, user2, status) VALUES (23, 29, NULL);
INSERT INTO match (user1, user2, status) VALUES (23, 31, NULL);
INSERT INTO match (user1, user2, status) VALUES (24, 1, NULL);
INSERT INTO match (user1, user2, status) VALUES (24, 2, NULL);
INSERT INTO match (user1, user2, status) VALUES (24, 3, NULL);
INSERT INTO match (user1, user2, status) VALUES (24, 5, NULL);
INSERT INTO match (user1, user2, status) VALUES (24, 6, NULL);
INSERT INTO match (user1, user2, status) VALUES (24, 7, NULL);
INSERT INTO match (user1, user2, status) VALUES (24, 8, NULL);
INSERT INTO match (user1, user2, status) VALUES (24, 9, NULL);
INSERT INTO match (user1, user2, status) VALUES (24, 10, NULL);
INSERT INTO match (user1, user2, status) VALUES (24, 12, NULL);
INSERT INTO match (user1, user2, status) VALUES (24, 13, NULL);
INSERT INTO match (user1, user2, status) VALUES (24, 15, NULL);
INSERT INTO match (user1, user2, status) VALUES (24, 16, NULL);
INSERT INTO match (user1, user2, status) VALUES (24, 17, NULL);
INSERT INTO match (user1, user2, status) VALUES (24, 18, NULL);
INSERT INTO match (user1, user2, status) VALUES (24, 19, NULL);
INSERT INTO match (user1, user2, status) VALUES (24, 20, NULL);
INSERT INTO match (user1, user2, status) VALUES (24, 21, NULL);
INSERT INTO match (user1, user2, status) VALUES (24, 22, NULL);
INSERT INTO match (user1, user2, status) VALUES (24, 27, NULL);
INSERT INTO match (user1, user2, status) VALUES (24, 29, NULL);
INSERT INTO match (user1, user2, status) VALUES (24, 30, NULL);
INSERT INTO match (user1, user2, status) VALUES (24, 31, NULL);
INSERT INTO match (user1, user2, status) VALUES (25, 2, NULL);
INSERT INTO match (user1, user2, status) VALUES (25, 3, NULL);
INSERT INTO match (user1, user2, status) VALUES (25, 4, NULL);
INSERT INTO match (user1, user2, status) VALUES (25, 7, NULL);
INSERT INTO match (user1, user2, status) VALUES (25, 10, NULL);
INSERT INTO match (user1, user2, status) VALUES (25, 11, NULL);
INSERT INTO match (user1, user2, status) VALUES (25, 13, NULL);
INSERT INTO match (user1, user2, status) VALUES (25, 17, NULL);
INSERT INTO match (user1, user2, status) VALUES (25, 18, NULL);
INSERT INTO match (user1, user2, status) VALUES (25, 20, NULL);
INSERT INTO match (user1, user2, status) VALUES (25, 23, NULL);
INSERT INTO match (user1, user2, status) VALUES (25, 27, NULL);
INSERT INTO match (user1, user2, status) VALUES (25, 28, NULL);
INSERT INTO match (user1, user2, status) VALUES (25, 31, NULL);
INSERT INTO match (user1, user2, status) VALUES (26, 2, NULL);
INSERT INTO match (user1, user2, status) VALUES (26, 4, NULL);
INSERT INTO match (user1, user2, status) VALUES (26, 5, NULL);
INSERT INTO match (user1, user2, status) VALUES (26, 8, NULL);
INSERT INTO match (user1, user2, status) VALUES (26, 12, NULL);
INSERT INTO match (user1, user2, status) VALUES (26, 14, NULL);
INSERT INTO match (user1, user2, status) VALUES (26, 18, NULL);
INSERT INTO match (user1, user2, status) VALUES (26, 21, NULL);
INSERT INTO match (user1, user2, status) VALUES (26, 23, NULL);
INSERT INTO match (user1, user2, status) VALUES (26, 29, NULL);
INSERT INTO match (user1, user2, status) VALUES (26, 31, NULL);
INSERT INTO match (user1, user2, status) VALUES (27, 1, NULL);
INSERT INTO match (user1, user2, status) VALUES (27, 2, NULL);
INSERT INTO match (user1, user2, status) VALUES (27, 3, NULL);
INSERT INTO match (user1, user2, status) VALUES (27, 5, NULL);
INSERT INTO match (user1, user2, status) VALUES (27, 6, NULL);
INSERT INTO match (user1, user2, status) VALUES (27, 7, NULL);
INSERT INTO match (user1, user2, status) VALUES (27, 8, NULL);
INSERT INTO match (user1, user2, status) VALUES (27, 9, NULL);
INSERT INTO match (user1, user2, status) VALUES (27, 10, NULL);
INSERT INTO match (user1, user2, status) VALUES (27, 12, NULL);
INSERT INTO match (user1, user2, status) VALUES (27, 13, NULL);
INSERT INTO match (user1, user2, status) VALUES (27, 15, NULL);
INSERT INTO match (user1, user2, status) VALUES (27, 16, NULL);
INSERT INTO match (user1, user2, status) VALUES (27, 17, NULL);
INSERT INTO match (user1, user2, status) VALUES (27, 18, NULL);
INSERT INTO match (user1, user2, status) VALUES (27, 19, NULL);
INSERT INTO match (user1, user2, status) VALUES (27, 20, NULL);
INSERT INTO match (user1, user2, status) VALUES (27, 21, NULL);
INSERT INTO match (user1, user2, status) VALUES (27, 22, NULL);
INSERT INTO match (user1, user2, status) VALUES (27, 23, NULL);
INSERT INTO match (user1, user2, status) VALUES (27, 24, NULL);
INSERT INTO match (user1, user2, status) VALUES (27, 25, NULL);
INSERT INTO match (user1, user2, status) VALUES (27, 29, NULL);
INSERT INTO match (user1, user2, status) VALUES (27, 30, NULL);
INSERT INTO match (user1, user2, status) VALUES (27, 31, NULL);
INSERT INTO match (user1, user2, status) VALUES (28, 2, NULL);
INSERT INTO match (user1, user2, status) VALUES (28, 4, NULL);
INSERT INTO match (user1, user2, status) VALUES (28, 7, NULL);
INSERT INTO match (user1, user2, status) VALUES (28, 11, NULL);
INSERT INTO match (user1, user2, status) VALUES (28, 13, NULL);
INSERT INTO match (user1, user2, status) VALUES (28, 18, NULL);
INSERT INTO match (user1, user2, status) VALUES (28, 20, NULL);
INSERT INTO match (user1, user2, status) VALUES (28, 23, NULL);
INSERT INTO match (user1, user2, status) VALUES (28, 25, NULL);
INSERT INTO match (user1, user2, status) VALUES (29, 2, NULL);
INSERT INTO match (user1, user2, status) VALUES (29, 4, NULL);
INSERT INTO match (user1, user2, status) VALUES (29, 5, NULL);
INSERT INTO match (user1, user2, status) VALUES (29, 8, NULL);
INSERT INTO match (user1, user2, status) VALUES (29, 12, NULL);
INSERT INTO match (user1, user2, status) VALUES (29, 14, NULL);
INSERT INTO match (user1, user2, status) VALUES (29, 15, NULL);
INSERT INTO match (user1, user2, status) VALUES (29, 18, NULL);
INSERT INTO match (user1, user2, status) VALUES (29, 21, NULL);
INSERT INTO match (user1, user2, status) VALUES (29, 23, NULL);
INSERT INTO match (user1, user2, status) VALUES (29, 24, NULL);
INSERT INTO match (user1, user2, status) VALUES (29, 26, NULL);
INSERT INTO match (user1, user2, status) VALUES (29, 27, NULL);
INSERT INTO match (user1, user2, status) VALUES (29, 31, NULL);
INSERT INTO match (user1, user2, status) VALUES (30, 1, NULL);
INSERT INTO match (user1, user2, status) VALUES (30, 2, NULL);
INSERT INTO match (user1, user2, status) VALUES (30, 3, NULL);
INSERT INTO match (user1, user2, status) VALUES (30, 6, NULL);
INSERT INTO match (user1, user2, status) VALUES (30, 7, NULL);
INSERT INTO match (user1, user2, status) VALUES (30, 9, NULL);
INSERT INTO match (user1, user2, status) VALUES (30, 10, NULL);
INSERT INTO match (user1, user2, status) VALUES (30, 12, NULL);
INSERT INTO match (user1, user2, status) VALUES (30, 13, NULL);
INSERT INTO match (user1, user2, status) VALUES (30, 16, NULL);
INSERT INTO match (user1, user2, status) VALUES (30, 17, NULL);
INSERT INTO match (user1, user2, status) VALUES (30, 19, NULL);
INSERT INTO match (user1, user2, status) VALUES (30, 20, NULL);
INSERT INTO match (user1, user2, status) VALUES (30, 21, NULL);
INSERT INTO match (user1, user2, status) VALUES (30, 22, NULL);
INSERT INTO match (user1, user2, status) VALUES (30, 24, NULL);
INSERT INTO match (user1, user2, status) VALUES (30, 27, NULL);
INSERT INTO match (user1, user2, status) VALUES (30, 31, NULL);
INSERT INTO match (user1, user2, status) VALUES (31, 1, true);
INSERT INTO match (user1, user2, status) VALUES (31, 2, true);
INSERT INTO match (user1, user2, status) VALUES (31, 3, NULL);
INSERT INTO match (user1, user2, status) VALUES (31, 5, NULL);
INSERT INTO match (user1, user2, status) VALUES (31, 6, true);
INSERT INTO match (user1, user2, status) VALUES (31, 7, true);
INSERT INTO match (user1, user2, status) VALUES (31, 8, NULL);
INSERT INTO match (user1, user2, status) VALUES (31, 9, NULL);
INSERT INTO match (user1, user2, status) VALUES (31, 10, NULL);
INSERT INTO match (user1, user2, status) VALUES (31, 12, true);
INSERT INTO match (user1, user2, status) VALUES (31, 13, true);
INSERT INTO match (user1, user2, status) VALUES (31, 14, NULL);
INSERT INTO match (user1, user2, status) VALUES (31, 15, NULL);
INSERT INTO match (user1, user2, status) VALUES (31, 16, NULL);
INSERT INTO match (user1, user2, status) VALUES (31, 17, true);
INSERT INTO match (user1, user2, status) VALUES (31, 18, NULL);
INSERT INTO match (user1, user2, status) VALUES (31, 19, NULL);
INSERT INTO match (user1, user2, status) VALUES (31, 20, true);
INSERT INTO match (user1, user2, status) VALUES (31, 21, NULL);
INSERT INTO match (user1, user2, status) VALUES (31, 22, NULL);
INSERT INTO match (user1, user2, status) VALUES (31, 23, true);
INSERT INTO match (user1, user2, status) VALUES (31, 24, true);
INSERT INTO match (user1, user2, status) VALUES (31, 25, true);
INSERT INTO match (user1, user2, status) VALUES (31, 26, NULL);
INSERT INTO match (user1, user2, status) VALUES (31, 27, true);
INSERT INTO match (user1, user2, status) VALUES (31, 29, NULL);
INSERT INTO match (user1, user2, status) VALUES (31, 30, NULL);


--
-- PostgreSQL database dump complete
--
