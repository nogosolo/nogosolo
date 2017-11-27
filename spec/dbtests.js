const { db } = require('../database/index.js');
const { expect } = require('chai');
const { setup, addUsers } = require('./setupdbfortests.js');
const { seed } = require('../server/index.js');
// const app = require('../server/index.js');
// const schema = require('../database/schema.sql');
// const port = 8080;



// describe('', function() {
//   let server;
//
//   const clearDB = function(connection, tablenames, done) {
//     var count = 0;
//     tablenames.forEach(function(tablename) {
//       connection.query('DROP TABLE IF EXISTS ' + tablename, function() {
//         count++;
//         if (count === tablenames.length) {
//           return schema(db).then(done);
//         }
//       });
//     });
//   };
//
//   beforeEach(function(done) {
//
//     var tablenames = ['users', 'users_events', 'match'];
//
//     db.query(function(err) {
//       if (err) { return done(err); }
//       /* Empties the db table before each test so that multiple tests
//        * (or repeated runs of the tests) won't screw each other up: */
//       clearDB(db, tablenames, function() {
//         server = app.listen(port, done);
//       });
//     });
//
//     afterEach(function() { server.close(); });
//   });
// });


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
  // it('should be able to add new users to users table', (done) => {
  //   let queryString = `INSERT INTO users (name, username, password, bio, picture) VALUES ('Eugene Soo', 'eugene', 'singapore', 'What are you working on now?', 'https://media.licdn.com/mpr/mpr/shrinknp_200_200/p/8/005/064/23a/20b00c9.jpg')`;
  //   db.query(queryString)
  //     .then((data) => {
  //       console.log('outside THE THEN')
  //
  //       db.query(`SELECT * FROM users WHERE username = 'eugene'`)
  //       .then((data) => {
  //         console.log('INSIDE THE THEN')
  //         expect(data.length).to.equal(1);
  //         db.query(setup)
  //         done();
  //         // .then(() => {
  //         //   db.query(addUsers)
  //         //   .then(() => {
  //         //     done();
  //         //   })
  //         //   .catch((err) => {
  //         //     console.log('uhoh', err);
  //         //   })
  //         // });
  //       })
  //       .catch((err) => {
  //         console.log('EUGENE was not added', err);
  //       })
  //     })
  //     .catch((err) => {
  //       console.log('Eugene was not added2', err);
  //     })
  //  })
  // it('should be add an event when a user clicks', (done) => {
  //   let queryString = `INSERT INTO users (name, username, password, bio, picture) VALUES ('Eugene Soo', 'eugene', 'singapore', 'What are you working on now?', 'https://media.licdn.com/mpr/mpr/shrinknp_200_200/p/8/005/064/23a/20b00c9.jpg')`;
  //   db.query(addUsers)
  //     .then((data) => {
  //       db.query(queryString)
  //         .then((data) => {
  //           queryString = `INSERT INTO users_events (userId, eventId, eventInfoStr) VALUES (32, 1, 'Pizza party on 2017-12-01 at 944 Market Street, San Francisco, US')`;
  //           db.query(queryString)
  //           .then((data) => {
  //             db.query(`SELECT * FROM users_events WHERE userId = 32`)
  //             .then((data) => {
  //               expect(data.length).to.equal(1);
  //               done();
  //             })
  //           })
  //             .catch((err) => {
  //               console.log('There is no pizza', err);
  //             })
  //         })
  //         .catch((err) => {
  //           console.log('Sad day, no pizza for Eugene', err);
  //         })
  //     })
  //     .catch((err) => {
  //       console.error(err);
  //     })
  // })
});
