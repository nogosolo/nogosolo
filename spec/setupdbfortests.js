
const setupString = 'DROP TABLE if exists match; DROP TABLE if exists users_events; DROP TABLE if exists users; CREATE TABLE users (id SERIAL, name VARCHAR(25) NULL DEFAULT NULL, username VARCHAR(25) NULL DEFAULT NULL, password VARCHAR(25) NULL DEFAULT NULL, bio VARCHAR(255) NULL DEFAULT NULL, picture VARCHAR(255) NULL DEFAULT NULL, PRIMARY KEY (id)); CREATE TABLE users_events (id SERIAL, userId INTEGER NOT NULL, eventId VARCHAR(255) NOT NULL, eventInfoStr VARCHAR(255) NULL DEFAULT NULL, -- date TIMESTAMP NULL DEFAULT NULL, PRIMARY KEY (id)); CREATE TABLE match (id SERIAL, user1 INTEGER NOT NULL, user2 INTEGER NOT NULL, status BOOLEAN DEFAULT NULL, PRIMARY KEY (id)); ALTER TABLE users_events ADD FOREIGN KEY (userId) REFERENCES users (id); ALTER TABLE match ADD FOREIGN KEY (user1) REFERENCES users (id); ALTER TABLE match ADD FOREIGN KEY (user2) REFERENCES users (id);';


const addUsers = `INSERT INTO users (id, name, username, password, bio, picture) VALUES (1, 'Allen Price', 'hackerpirate', 'hackreactor', 'I am the leader of a band of puny giraffe pirates and I code on the side.', 'https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAAKuAAAAJDQxMDgwYWYwLTdjZmEtNDkwMy04NDAzLTU0MDQ2N2I1YTA4ZA.jpg');
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
INSERT INTO users (id, name, username, password, bio, picture) VALUES (31, 'William Gross', 'rudyred', 'hockey', 'Did you know you cant put 4 of the same characters in a row in a Roman Numeral?', 'https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAAKuAAAAJDQxMDgwYWYwLTdjZmEtNDkwMy04NDAzLTU0MDQ2N2I1YTA4ZA.jpg');`;
module.exports.setup = setupString;
module.exports.addUsers = addUsers.split(/\r?\n/).join(' ');

// DROP DATABASE IF EXISTS nogosolo;
// --
// CREATE DATABASE nogosolo;
// --
// \connect nogosolo;
//
// CREATE TABLE users (
//   id SERIAL,
//   name VARCHAR(25) NULL DEFAULT NULL,
//   username VARCHAR(25) NULL DEFAULT NULL,
//   password VARCHAR(25) NULL DEFAULT NULL,
//   bio VARCHAR(255) NULL DEFAULT NULL,
//   picture VARCHAR(255) NULL DEFAULT NULL,
//   PRIMARY KEY (id)
// );
//
// CREATE TABLE users_events (
//   id SERIAL,
//   userId INTEGER NOT NULL,
//   eventId VARCHAR(255) NOT NULL,
//   eventInfoStr VARCHAR(255) NULL DEFAULT NULL,
//   -- date TIMESTAMP NULL DEFAULT NULL,
//   PRIMARY KEY (id)
// );
//
// CREATE TABLE match (
//   id SERIAL,
//   user1 INTEGER NOT NULL,
//   user2 INTEGER NOT NULL,
//   status BOOLEAN DEFAULT NULL,
//   PRIMARY KEY (id)
// );
//
// ALTER TABLE users_events ADD FOREIGN KEY (userId) REFERENCES users (id);
// ALTER TABLE match ADD FOREIGN KEY (user1) REFERENCES users (id);
// ALTER TABLE match ADD FOREIGN KEY (user2) REFERENCES users (id);
// const dropMatch = 'DROP TABLE if exists match';
// const dropEvents = 'DROP TABLE if exists users_events';
// const dropUsers = 'DROP TABLE if exists users';
// const createUsersTable = 'CREATE TABLE users (
//   id SERIAL,
//   name VARCHAR(25) NULL DEFAULT NULL,
//   username VARCHAR(25) NULL DEFAULT NULL,
//   password VARCHAR(25) NULL DEFAULT NULL,
//   bio VARCHAR(255) NULL DEFAULT NULL,
//   picture VARCHAR(255) NULL DEFAULT NULL,
//   PRIMARY KEY (id)
// )';
// const createEventsTable = 'CREATE TABLE users_events (
//   id SERIAL,
//   userId INTEGER NOT NULL,
//   eventId VARCHAR(255) NOT NULL,
//   eventInfoStr VARCHAR(255) NULL DEFAULT NULL,
//   -- date TIMESTAMP NULL DEFAULT NULL,
//   PRIMARY KEY (id)
// )';
// const createMatchTable = 'CREATE TABLE match (
//   id SERIAL,
//   user1 INTEGER NOT NULL,
//   user2 INTEGER NOT NULL,
//   status BOOLEAN DEFAULT NULL,
//   PRIMARY KEY (id)
// )';
// const linkTables = 'ALTER TABLE users_events ADD FOREIGN KEY (userId) REFERENCES users (id);
// ALTER TABLE match ADD FOREIGN KEY (user1) REFERENCES users (id);
// ALTER TABLE match ADD FOREIGN KEY (user2) REFERENCES users (id);'
// module.exports.dropMatch = dropMatch;
// module.exports.dropEvents = dropEvents;
// module.exports.dropUsers = dropUsers;
