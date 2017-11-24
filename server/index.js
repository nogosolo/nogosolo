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


app.get('/match/:username', (req, res) => {
  const query = `SELECT * FROM users
  WHERE username = '${req.url.split('/')[2]}'`;
  db.query(query)
    .then((data) => {
      res.json(data[0]);
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
