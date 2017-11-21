var pg = require('pg');

// var connection = mysql.createConnection({
//   host     : 'localhost',
//   user     : 'root',
//   password : 'FILL_ME_IN',
//   database : 'test'
// });

var connection = pg.createConnection({
  host: 'localhost',
  user: 'root',
  database: 'nogosolo'
});

var authenticateUser = function(callback) {
  connection.query('SELECT * FROM users', function(err, results, fields) {
    if (err) {
      callback(err, null);
    } else {
      callback(null, results);
    }
  })
}

var selectAll = function(callback) {
  connection.query('SELECT * FROM items', function(err, results, fields) {
    if(err) {
      callback(err, null);
    } else {
      callback(null, results);
    }
  });
};

module.exports.selectAll = selectAll;
module.exports.authenticateUser = authenticateUser;
