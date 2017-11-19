import React from 'react';
import SiteNavBar from './SiteNavBar';
import Main from './Main';
import LoginPage from './LoginPage';

class App extends React.Component {
  constructor(props) {
    super(props);
    this.toggleLogin = this.toggleLogin.bind(this);
    this.state = {
      showLogin: false,
    };
  }

  toggleLogin() {
    this.setState({ showLogin: !this.state.showLogin });
  }


  render() {
    return (
      <div>
        <SiteNavBar triggerLogin={this.toggleLogin} />
        <Main />
        {this.state.showLogin && (<LoginPage triggerLogin={this.toggleLogin} />)}
      </div>
    );
  }
}

export default App;
