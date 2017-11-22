import React from 'react';
import SiteNavBar from './SiteNavBar';
import Main from './Main';
import LoginPage from './LoginPage';

class App extends React.Component {
  constructor(props) {
    super(props);
    this.toggleLogin = this.toggleLogin.bind(this);
    this.searchHandler = this.searchHandler.bind(this);
    this.state = {
      showLogin: false,
      searchQuery: '',
    };
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
        <Main searchQuery={this.state.searchQuery} />
        {this.state.showLogin && (<LoginPage triggerLogin={this.toggleLogin} />)}
      </div>
    );
  }
}

export default App;
