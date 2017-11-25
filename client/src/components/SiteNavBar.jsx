import React from 'react';
import { Link } from 'react-router-dom';
import LoginButton from './LoginButton';
import SearchBox from './SearchBox';

// The Header creates links that can be used to navigate
// between routes.
const SiteNavBar = function (props) {
  return (
    <header>
      <nav className="bar">
        <span>
          <span className="home"><Link to="/" >Home</Link></span>
          {!props.isLoggedin && (<span className="signupbutton"><Link to="/signup">Sign up</Link></span>)}
          {!props.isLoggedin && (<span className="loginbutton"><LoginButton triggerLogin={props.triggerLogin} /></span>)}
          <Link to="/match"> Find Your Match </Link>
          <b><SearchBox className="searchbar" searchHandler={props.searchHandler} /></b>
        </span>
      </nav>
    </header>
  );
};

export default SiteNavBar;
