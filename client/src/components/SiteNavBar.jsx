import React from 'react';
import { Link } from 'react-router-dom';

// The Header creates links that can be used to navigate
// between routes.
const SiteNavBar = () => (
  <header>
    <nav>
      <ul>
        <li><Link to="/">Home</Link></li>
        {/* <li><Link to="/events">events</Link></li> */}
        {/* <li><Link to='/schedule'>Schedule</Link></li> */}
      </ul>
    </nav>
  </header>
);

export default SiteNavBar;
