const express = require('express');
const bodyParser = require('body-parser');
const { dummyData } = require('../database/dummyData.js');
const { db } = require('../database/index.js');
const helpers = require('./helpers.js');

const app = express();

app.use(express.static(`${__dirname}/../client/dist`));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));


// `INSERT INTO users (username, password, )
//   VALUES ("${entry.username}", )`

app.post('/match', (req, res) => {
  const query = `UPDATE match
  SET status = CASE ${req.body.matchStatus} WHEN 1 THEN TRUE ELSE FALSE END
  WHERE user1 = ${req.body.userId} AND user2 = ${req.body.matchId}`;
  db.query(query)
    .then(() => {
      res.end(`Match status successfully updates to: ${req.body.matchStatus}`);
    });
});

app.get('/match/:userId', (req, res) => {
  const reply = {};
  const query = `SELECT distinct u.id, u2.name as "matchName"
  , u2.id as "matchId", u2.bio, u2.picture FROM users u
    INNER JOIN user_event ue
      ON u.id = ue.userid
    INNER JOIN match m
      ON u.id = m.user1
    INNER JOIN users u2
      ON m.user2 = u2.id
    WHERE m.status IS NULL AND u.id = ${req.url.split('/')[2]}
    limit 1`;
  db.query(query)
    .then((matchData) => {
      if (!matchData.length) {
        res.end('No new potential matches');
      }
      reply.name = matchData[0].matchName;
      reply.bio = matchData[0].bio;
      reply.picture = matchData[0].picture;
      reply.matchId = matchData[0].matchId;
      reply.events = [];
      db.query(`SELECT eventId from user_event
        WHERE userId = ${matchData[0].matchId}`)
        .then((events) => {
          for (let i = 0; i < events.length; i += 1) {
            reply.events.push(events[i].eventid);
            if (i === events.length - 1) {
              res.json(reply);
            }
          }
        })
        .catch((err) => {
          console.log('THIS IS AN ERROR', err);
        });
    })
    .catch((err) => {
      console.log('THIS IS AN ERROR', err);
    });
});

app.post('/signup', (req, res) => {
  const userEntry = req.body;
  const query = `SELECT * FROM users
  WHERE username = '${req.body.username}'`;
  db.query(query)
    .then((data) => {
      if (data.length) {
        res.end('Username is already taken!');
      } else {
        db.query(`INSERT INTO users (name, username, password, bio, picture)
        VALUES ('${userEntry.name}', '${userEntry.username}', '${userEntry.password}', '${userEntry.bio}', '${userEntry.picture}')`)
          .then(() => {
            console.log(`${userEntry.name} with username ${userEntry.username} was successfully added to the DB`);
            res.end(`${userEntry.name} with username ${userEntry.username} was successfully added to the DB`);
          })
          .catch((err) => {
            console.log('THIS IS AN ERROR', err);
          });
      }
    });
});

app.post('/login', (req, res) => {
   const { username, password } = req.body;
   console.log('!!!!!!!!!!!!!', password);
   db.query(`SELECT * FROM users WHERE username = '${username}' AND password = '${password}'`)
     .then((data) => {
       console.log('8888888888888', Array.isArray(data));
       if (data.length === 0) {
         console.log('incorrect login, please try again');
         res.end('redirect to login again');
       } else {
         (console.log('login confirmed'));
         const reply = {
           userid: data[0].id,
           name: data[0].name,
           username: data[0].username,
           bio: data[0].bio,
           picture: data[0].picture,
         };
         res.end(JSON.stringify(reply));
       }

app.post('/event', (req, res) => {
  db.query(`INSERT INTO user_event (userId, eventId)
  VALUES (${req.body.userId}, '${req.body.eventId}')`)
    .then(() => {
      console.log(`userID:${req.body.userid} and eventID: ${req.body.eventId} was successfully added to the DB`);
      res.end(`userID:${req.body.userId} and eventID: ${req.body.eventId} was successfully added to the DB`);
    })
    .catch((err) => {
      console.log('There was an Error', err);
    });
});

function addPotentialMatchInit(userid, eventid) { // temporary to populate database
  db.query(`SELECT * FROM user_event
    WHERE eventId = '${eventid}' AND NOT userId = ${userid}`)
    .then((data) => {
      data.forEach((entry) => {
        db.query(`SELECT * FROM match
          WHERE user1 = ${userid} AND user2 = ${entry.userid}`)
          .then((matchEntry) => {
            if (!matchEntry.length) {
              db.query(`INSERT INTO match (user1, user2)
              VALUES (${userid}, ${entry.userid})`)
                .then(() => {
                  console.log(`potential match with ${userid}, ${entry.userid} added`);
                });
            }
          })
          .catch((err) => {
            console.log('THIS IS AN ERROR', err);
          });
      });
    })
    .catch((err) => {
      console.log('THIS IS AN ERROR', err);
    });
}

function initialDBPopulation() {
  dummyData.forEach((entry) => {
    db.query(`INSERT INTO users (name, username, password, bio, picture)
    VALUES ('${entry.name}', '${entry.username}', '${entry.password}', '${entry.bio}', '${entry.picture}')`)
      .then(() => {
        db.query(`SELECT id FROM users WHERE username = '${entry.username}'`)
          .then((data) => {
            entry.events.forEach((event) => {
              const eventStr = `${event}d`;
              const queryStr = `INSERT INTO user_event (userid, eventid)
              VALUES (${data[0].id}, '${eventStr}')`;
              db.query(queryStr)
                .then(() => {
                  console.log(`${entry.name} going to event: ${event} added to DB`);
                });
            });
          });
        console.log(`${entry.name} with username ${entry.username} was successfully added to the DB`);
      })
      .catch((err) => {
        console.log('THIS IS AN ERROR', err);
      });
  });
}

db.query('select * from user_event')// temporary to populate database
  .then((data) => {
    if (data.length >= 124) {
      data.forEach((userevent) => {
        addPotentialMatchInit(userevent.userid, userevent.eventid);
      });
    }
  });
// select distinct user2 from match where user1 = 1

db.query('select * from users')
  .then((data) => {
    if (!data.length) {
      initialDBPopulation();
    }
  });

const host = '0.0.0.0';

app.listen(process.env.PORT || 8080, host, () => {
  console.log('listening on port 8080');
});
