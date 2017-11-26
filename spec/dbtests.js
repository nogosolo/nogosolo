const { db } = require('../database/index.js');
const expect = require('chai').expect;


describe('Database Schema:', function() {
   it('contains a users table', function(done) {
     let queryString = 'SELECT * FROM users';
     db.query(queryString)
       .then((data) => {
         expect(true).to.equal(true);
         done();
       })
       .catch((err) => {
         expect(false).to.equal(true);
         console.log('there is a problem in the users table', err);
       })
    })
    //  it('contains a ')
  })
