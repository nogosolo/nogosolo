NoGoSolo

NoGoSolo is an app that connects event goers so they never have to go alone.  It mixes ticketmaster search with sophisticated matching algorithms to connect event goers.  

Setup:
  npm install

Dependencies:

  postgresql: We are using postgresql because we have relational data and need a sql compliant database.  We chose postgresql over mysql because postgresql is ACID compliant and supports complex queries better than mysql does.  Read more about postgresql here: https://www.postgresql.org/.  

  pg-promise: We are using pg-promise to interact with our postgresql database.  You can read more about pg-promise here: https://github.com/vitaly-t/pg-promise.

  React and React Router: NoGoSolo is built using the React framework.  React router allows us to simulate a multipage app within a single page app.  Learn more about react here: https://reactjs.org/docs/hello-world.html.

API:
  We use the ticketmaster api.  Documentation can be found here: https://developer.ticketmaster.com/products-and-docs/apis/discovery-api/v2/.
