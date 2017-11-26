import React from 'react';
import { Link } from 'react-router-dom';
import LoginButton from './LoginButton';
import SearchBox from './SearchBox';

// The Header creates links that can be used to navigate
// between routes.
// const SiteNavBar = function (props) {
//   return (
//     <header className="header">
//       <nav className="bar">
//           <span className="home"><Link to="/" >Home</Link></span>
//           <SearchBox className="searchbar" searchHandler={props.searchHandler} />
//           {!props.isLoggedin && (<span className="signupbutton" type="submit"><Link to="/signup">Sign up</Link></span>)}
//           {!props.isLoggedin && (<span className="loginbutton"><LoginButton triggerLogin={props.triggerLogin} /></span>)}
//           <Link to="/match"> Find Your Match </Link>
//       </nav>
//     </header>
//   );
// };

const SiteNavBar = function(props) {
  return (
    <div className="topnav" id="myTopnav">
      <a href="/">Home</a>
      {!props.isLoggedin && (<Link to="/signup">Sign up</Link>)}
      {!props.isLoggedin && (<LoginButton triggerLogin={props.triggerLogin} />)}
      <Link to="/match">Match </Link>
      <SearchBox className="searchbar" searchHandler={props.searchHandler} />
    </div>
  )
}

export default SiteNavBar;
