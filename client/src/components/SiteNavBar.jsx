import React from 'react';
import { Link } from 'react-router-dom';
import LoginButton from './LoginButton';

// The Header creates links that can be used to navigate
// between routes.
const SiteNavBar = function (props) {
  return (
    <header>
      <nav>
        <ul>
          <li><Link to="/" >Home</Link></li>
          <li><LoginButton triggerLogin={props.triggerLogin} /></li>
          <li><Link to="/signup">Sign up</Link></li>
          {/* <li><Link to='/schedule'>Schedule</Link></li> */}
        </ul>
      </nav>
    </header>
  );
};


export default SiteNavBar;
