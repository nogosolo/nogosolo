const pgp = require('pg-promise')();

//  use this command to start postgress in terminal:
//  pg_ctl -D /usr/local/var/postgres start

const configObj = {
  host: 'localhost',
  database: 'nogosolo',
  user: 'nogosolo',
};

const db = pgp(configObj);

module.exports.db = db;
