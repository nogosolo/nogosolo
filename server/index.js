const express = require('express');
const bodyParser = require('body-parser');
const { dummyData } = require('../database/dummyData.js');
const { db } = require('../database/index.js');
const helpers = require('./helpers.js');

const app = express();

app.use(express.static(`${__dirname}/../client/dist`));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));


app.get('/viewMatches/:userId', (req, res) => {
  const replyObj = {};
  const query = `SELECT distinct ue.eventId as "eventId", u2.name as "matchName"
      , u2.id as "matchId", u2.bio, u2.picture,
      ue.eventInfoStr as "eventInfoStr" FROM users u
        INNER JOIN users_events ue
          ON u.id = ue.userid
        INNER JOIN match m
          ON u.id = m.user1
        INNER JOIN users u2
          ON m.user2 = u2.id
        INNER JOIN match m2
          ON m.user2 = m2.user1
        WHERE m.status IS TRUE AND m2.status IS TRUE AND u.id = '${req.url.split('/')[2]}'`;
  db.query(query)
    .then((matchData) => {
      if (!matchData.length) {
        res.end('No matches');
      }
      matchData.forEach((matchesEvent) => {
        if (replyObj[matchesEvent.matchId]) {
          replyObj[matchesEvent.matchId].events.push(matchesEvent.eventInfoStr);
        } else {
          replyObj[matchesEvent.matchId] = {
            name: matchesEvent.matchName,
            picture: matchesEvent.picture,
            bio: matchesEvent.bio,
            events: [matchesEvent.eventInfoStr],
          };
        }
      });
      const keys = Object.keys(replyObj);
      const reply = [];
      keys.forEach((key) => {
        reply.push(replyObj[key]);
      });
      res.json(reply);
    })
    .catch((err) => {
      console.log('THIS IS AN ERROR', err);
    });
});

app.post('/match', (req, res) => {
  const query = `UPDATE match
  SET status = CASE ${req.body.matchStatus} WHEN 1 THEN TRUE ELSE FALSE END
  WHERE user1 = ${req.body.userId} AND user2 = ${req.body.matchId}`;
  db.query(query)
    .then(() => {
      res.end(`Match status successfully updates to: ${req.body.matchStatus}`);
    });
});

app.get('/event/:eventId/:userId', (req, res) => {
  reqArr = req.url.split('/');
  const query = `SELECT * FROM users_events
  WHERE userId = ${reqArr[3]} AND eventId = '${reqArr[2]}'`;
  db.query(query)
    .then((eventData) => {
      if (eventData.length) {
        res.send(true);
      } else {
        res.send(false);
      }
    })
    .catch((err) => {
      console.log('THIS IS AN ERROR', err);
    });
});

app.get('/match/:userId', (req, res) => {
  const reply = {};
  const query = `SELECT distinct u.id, u2.name as "matchName"
  , u2.id as "matchId", u2.bio, u2.picture FROM users u
    INNER JOIN users_events ue
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
      db.query(`SELECT eventInfoStr as "eventInfoStr" from users_events
        WHERE userId = ${matchData[0].matchId}`)
        .then((events) => {
          for (let i = 0; i < events.length; i += 1) {
            reply.events.push(events[i].eventInfoStr);
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
    })
    .catch((err) => {
      console.log('There was an Error', err);
    });
});

app.post('/event', (req, res) => {
  db.query(`INSERT INTO users_events (userId, eventId, eventInfoStr)
  VALUES (${req.body.userId}, '${req.body.eventId}', '${req.body.eventInfoStr}')`)
    .then(() => {
      console.log(`userID:${req.body.userId} and eventID: ${req.body.eventId} was successfully added to the DB`);
      helpers.addPotentialMatchs(req.body.userId, req.body.eventId);
      res.end(`userID:${req.body.userId} and eventID: ${req.body.eventId} was successfully added to the DB`);
    })
    .catch((err) => {
      console.log('There was an Error', err);
    });
});

function addPotentialMatchInit(userid, eventid) { // temporary to populate database
  db.query(`SELECT * FROM users_events
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
              const queryStr = `INSERT INTO users_events (userid, eventid, eventInfoStr)
              VALUES (${data[0].id}, '${eventStr}', '${eventStr}')`;
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

db.query('select * from users_events') // temporary to populate database need to run server twice to properly populate
  .then((data) => {
    if (data.length >= 124) {
      data.forEach((userevent) => {
        addPotentialMatchInit(userevent.userid, userevent.eventid);
      });
    }
  });

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
