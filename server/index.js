
const express = require('express');
const bodyParser = require('body-parser');

const app = express();

app.use(express.static(`${__dirname}/../client/dist`));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));

app.post('/', (req, res) => {

});

app.get('/', (req, res) => {

});

app.listen(8080, () => {
  console.log('listening on port 8080');
});
