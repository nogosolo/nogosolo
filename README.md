# NoGoSolo

NoGoSolo is an app that connects event goers so they never have to go alone.  It mixes ticketmaster search with sophisticated matching algorithms to connect event goers. 

## Dependencies:

  postgresql: We are using postgresql because we have relational data and need a sql compliant database.  We chose postgresql over mysql because postgresql is ACID compliant and supports complex queries better than mysql does.  Read more about postgresql here: https://www.postgresql.org/.  

  pg-promise: We are using pg-promise to interact with our postgresql database.  You can read more about pg-promise here: https://github.com/vitaly-t/pg-promise.

  React and React Router: NoGoSolo is built using the React framework.  React router allows us to simulate a multipage app within a single page app.  Learn more about react here: https://reactjs.org/docs/hello-world.html.

## API:
  We use the ticketmaster api.  Documentation can be found here: https://developer.ticketmaster.com/products-and-docs/
  apis/discovery-api/v2/.

## Getting Started

### Setup:

- [ ] In your terminal, navigate to the `nogosolo` directory and run `npm install` to install dependencies.
- [ ] Install postgresql by running `brew install postgresql`
- [ ] Access your postgres run `psql postgres`
- [ ] Inside of db terminal, create a role by running `CREATE ROLE your_role_name;`
- [ ] Run `ALTER ROLE your_role_name CREATEDB;` and `ALTER ROLE your_role_name WITH LOGIN;` to give premissions to the role you just created.
- [ ] Create a user for your role by running `createuser your_role_name --createdb;`
- [ ] Run `psql postgres -U your_role_name < database/schema.sql` to create the database tables.
- [ ] In another terminal, run `npm run init:db` to populate data from database.
- [ ] Run `npm run server-dev` to start server.
- [ ] In another terminal, run `npm run react-dev`
