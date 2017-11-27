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
  it('contains a users_events table', (done) => {
    let queryString = 'SELECT * FROM users_events';
    db.query(queryString)
      .then((data) => {
        expect(true).to.equal(true);
        done();
      })
      .catch((err) => {
        expect(false).to.equal(true);
        console.log('there is a problem in the users_events table', err);
      });
  });
  it('contains a match table', (done) => {
    let queryString = 'SELECT * FROM match';
    db.query(queryString)
      .then((data) => {
        expect(true).to.equal(true);
        done();
      })
      .catch((err) => {
        expect(false).to.equal(true);
        console.log('there is a problem in the match table', err);
      });
  });
  it('should be able to add new users to users table', (done) => {
    let queryString = `INSERT INTO users (name, username, password, bio, picture) VALUES ('Eugene Soo', 'eugene', 'singapore', 'What are you working on now?', 'https://media.licdn.com/mpr/mpr/shrinknp_200_200/p/8/005/064/23a/20b00c9.jpg')`;
    db.query(queryString)
      .then((data) => {
        db.query(`SELECT * FROM users WHERE username = 'eugene'`)
        .then((data) => {
          expect(data.length).to.equal(1);
          done();
        })
        .catch((err) => {
          console.log('EUGENE was not added', err);
        })
      })
      .catch((err) => {
        console.log('Eugene was not added', err);
      })
  })
});
