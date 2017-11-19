import React from 'react';
import enhanceWithClickOutside from 'react-click-outside';
import { Link } from 'react-router-dom';


class LoginPage extends React.Component {
  constructor(props) {
    super(props);
    this.changeHandler = this.changeHandler.bind(this);
    this.handleClickOutside = this.handleClickOutside.bind(this);
    this.clickHandler = this.clickHandler.bind(this);
    this.state = {
      username: '',
      password: '',
    };
  }

  handleClickOutside() {
    this.props.triggerLogin();
  }

  clickHandler(event) {
    const currentState = this.state.active;
    this.setState({ active: !currentState });
  }

  handleSignin() {
    console.log(this.state.username)
  }

  changeHandler(event) {
    this.setState({
      [event.target.id]: event.target.value,
    });
  }

  render() {
    return (
      <div className="modal">
        <form className="modal-content animate" >
          <div className="imgcontainer">
            <img src="http://lorempixel.com/1000/1000" alt="Avatar" className="avatar" />
          </div>
          <div className="container">
            <b>Username</b>
            <input
              type="text"
              onChange={this.changeHandler}
              placeholder="Enter Username"
              name="uname"
              required
            />
            <b>Password</b>
            <input
              type="password"
              onChange={this.changeHandler}
              placeholder="Enter Password"
              name="psw"
              required
            />
            <button type="submit">Login</button>
          </div>
          <div className="container" style={{ backgroundColor: '#f1f1f1' }}>
            <button
              type="button"
              onClick={this.handleClickOutside}
              className="cancelbtn"
            >
              Cancel
            </button>
            {/* <button type="button" className="signupbtn"> */}
            <Link
              onClick={this.handleClickOutside}
              className="signupbtn"
              to="/signup"
            >
              Sign up
            </Link>
            {/* </button> */}
          </div>
        </form>
      </div>
    );
  }
}


export default enhanceWithClickOutside(LoginPage);
