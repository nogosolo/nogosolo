const pgp = require('pg-promise')();

//  use this command to start postgress in terminal:
//  pg_ctl -D /usr/local/var/postgres start

// var connection = mysql.createConnection({
//   host     : 'localhost',
//   user     : 'root',
//   password : 'FILL_ME_IN',
//   database : 'test'
// });

const configObj = {
  host: 'localhost',
  database: 'nogosolo',
  user: 'nogosolo',
};

const db = pgp(configObj);
// const conString = 'postgres://nogosolo@localhost:8080/nogosolo';

// const client = new pg.Client(conString);
// client.connect();

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
  db.query('SELECT * FROM users', (err, results, fields) => {
    if (err) {
      callback(err, null);
    } else {
      callback(null, results);
    }
  });
};

module.exports.selectAll = selectAllUsers;
// module.exports.authenticateUser = authenticateUser;
module.exports.db = db;
