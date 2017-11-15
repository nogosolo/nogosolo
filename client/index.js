import React from ('react');
import ReactDOM from ('ReactDom');

class App extends React.component{
  constructor(props) {
    super(props);
    this.state = {
      loggedIn: false
    };
  }
  render() => {
    return (
      <div>
        <span><Login/></span>
        <Search/>
      </div>)
  }
}

ReactDOM.render(<App />, document.getElementById('app'));