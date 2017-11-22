
const express = require('express');
const bodyParser = require('body-parser');
const dummyData = require('../database/dummyData.js');
const { db } = require('../database/index.js');

const app = express();

app.use(express.static(`${__dirname}/../client/dist`));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));

app.post('/dummyData', (req, res) => {
  console.log(typeof db.query);
  dummyData.dummyData.forEach(entry => {db.query(`INSERT INTO users (name, username, password, bio, picture)
    VALUES ('${entry.name}', '${entry.username}', '${entry.password}', '${entry.bio}', '${entry.picture}')`)
    .then(
      console.log('successfully added dummy data');
      res.end())
    .catch(err => {
      console.log('THIS IS AN ERROR', err);
    });
  });
});

// `INSERT INTO users (username, password, )
//   VALUES ("${entry.username}", )`

app.post('/', (req, res) => {

});

app.get('/', (req, res) => {

});

app.listen(8080, () => {
  console.log('listening on port 8080');
});
