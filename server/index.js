const express = require('express');
const bodyParser = require('body-parser');
const { dummyData } = require('../database/dummyData.js');
const { db } = require('../database/index.js');

const app = express();

app.use(express.static(`${__dirname}/../client/dist`));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));


app.post('/dummyData', (req, res) => {
  // console.log(typeof db.query);
  dummyData.dummyData.forEach((entry) => {
    db.query(`INSERT INTO users (name, username, password, bio, picture)
    VALUES ('${entry.name}', '${entry.username}', '${entry.password}', '${entry.bio}', '${entry.picture}')`)
      .then(() => {
        console.log('successfully added dummy data');
        res.end();
      })
      .catch((err) => {
        console.log('THIS IS AN ERROR', err);
      });
  });
});


// `INSERT INTO users (username, password, )
//   VALUES ("${entry.username}", )`

// app.post('/', (req, res) => {

// app.post('/', (req, res) => {
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

// });

// app.get('/', (req, res) => {

// });

function initialDBPopulation() {
  dummyData.forEach((entry) => {
    db.query(`INSERT INTO users (name, username, password, bio, picture)
    VALUES ('${entry.name}', '${entry.username}', '${entry.password}', '${entry.bio}', '${entry.picture}')`)
      .then(() => {
        console.log(`${entry.name} with username ${entry.username} was successfully added to the DB`);
      })
      .catch((err) => {
        console.log('THIS IS AN ERROR', err);
      });
  });
}

db.query('select * from users')
  .then((data) => {
    if (!data.length) {
      initialDBPopulation();
    }
  });

var host = '0.0.0.0';

app.listen(process.env.PORT || 8080, host, () => {
  console.log('listening on port 8080');
});
