const pg = require('pg');

// var connection = mysql.createConnection({
//   host     : 'localhost',
//   user     : 'root',
//   password : 'FILL_ME_IN',
//   database : 'test'
// });

const conString = 'postgres://nogosolo@localhost:8080/nogosolo';

const client = new pg.Client(conString);
client.connect();

// const connection = pg.createConnection({
//   host: 'localhost',
//   user: 'root',
//   database: 'nogosolo'
// });

// const authenticateUser = function (callback) {
//   client.query('SELECT * FROM users', (err, results, fields) => {
//     if (err) {
//       callback(err, null);
//     } else {
//       callback(null, results);
//     }
//   });
// };

const selectAllUsers = function (callback) {
  client.query('SELECT * FROM users', (err, results, fields) => {
    if (err) {
      callback(err, null);
    } else {
      callback(null, results);
    }
  });
};

module.exports.selectAll = selectAll;
module.exports.authenticateUser = authenticateUser;
