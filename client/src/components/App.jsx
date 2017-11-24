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
      userid: 0,
      name: '',
      username: '',
      bio: '',
      picture: '',
    };
  }
  setUser(userdata) {
    // console.log('ID : ', userdata.userid);
    // console.log('this is what is passed up to app', userdata);
    // console.log('this is the state before', this.state);
    this.setState({
      userid: userdata.userid,
      name: userdata.name,
      username: userdata.username,
      bio: userdata.bio,
      picture: userdata.picture,
      alreadyLoggedin: !this.state.alreadyLoggedin,
    })
    // console.log('this is the state after', this.state);


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
        <SiteNavBar triggerLogin={this.toggleLogin} searchHandler={this.searchHandler} />
        <Main searchQuery={this.state.searchQuery} userName={this.state.username}/>
        {this.state.showLogin && (<LoginPage setUser={this.setUser} triggerLogin={this.toggleLogin} />)}
      </div>
    );
  }
}

export default App;
