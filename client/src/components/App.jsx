import React from 'react';
import SiteNavBar from './SiteNavBar';
import Main from './Main';
import LoginPage from './LoginPage';

class App extends React.Component {
  constructor(props) {
    super(props);
    this.toggleLogin = this.toggleLogin.bind(this);
    this.searchHandler = this.searchHandler.bind(this);
    this.setUser = this.setUser.bind(this);
    this.state = {
      showLogin: false,
      searchQuery: '',
      alreadyLoggedin: false,
      userdata: {
        userid: 0,
        name: '',
        username: '',
        bio: '',
        picture: '',
      },
    };
  }
  setUser(userdata) {
    this.setState({
      userdata: {
        userid: userdata.userid,
          name: userdata.name,
          username: userdata.username,
          bio: userdata.bio,
          picture: userdata.picture,
      },
      alreadyLoggedin: !this.state.alreadyLoggedin,
    })
  }

  searchHandler(query) {
    this.setState({
      searchQuery: query,
    });
  }

  toggleLogin() {
    this.setState({ showLogin: !this.state.showLogin });
  }

  render() {
    return (
      <div>
        <SiteNavBar triggerLogin={this.toggleLogin} searchHandler={this.searchHandler}
        isLoggedin={this.state.alreadyLoggedin}/>
        <Main searchQuery={this.state.searchQuery} userdata={this.state.userdata}/>
        {this.state.showLogin && (<LoginPage setUser={this.setUser} triggerLogin={this.toggleLogin} />)}
      </div>
    );
  }
}

export default App;
