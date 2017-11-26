const { db } = require('../database/index.js');

function addPotentialMatchs(userid, eventid) { // Will be used within the event post request on server
  db.query(`SELECT * FROM users_events
    WHERE eventId = '${eventid}' AND NOT userId = ${userid}`)
    .then((data) => {
      data.forEach((entry) => {
        db.query(`SELECT * FROM match
          WHERE user1 = ${userid} AND user2 = ${entry.userid}`)
          .then((matchEntry) => {
            if (!matchEntry.length) {
              db.query(`INSERT INTO match (user1, user2)
              VALUES (${userid}, ${entry.userid})`)
                .then(() => {
                  console.log(`potential match with ${userid}, ${entry.userid} added`);
                });
              db.query(`INSERT INTO match (user1, user2)
                VALUES (${entry.userid}, ${userid})`)
                .then(() => {
                  console.log(`potential match with ${entry.userid}, ${userid} added`);
                });
            }
          })
          .catch((err) => {
            console.log('THIS IS AN ERROR', err);
          });
      });
    })
    .catch((err) => {
      console.log('THIS IS AN ERROR', err);
    });
}

module.exports.addPotentialMatchs = addPotentialMatchs;
