const { db } = require('../database/index.js');
const { expect } = require('chai');


describe('Database Schema:', () => {
  it('contains a users table', (done) => {
    let queryString = 'SELECT * FROM users';
    db.query(queryString)
      .then((data) => {
        expect(true).to.equal(true);
        done();
      })
      .catch((err) => {
        expect(false).to.equal(true);
        console.log('there is a problem in the users table', err);
      });
  });
  //  it('contains a ')
});
