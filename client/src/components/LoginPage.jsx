import React from 'react';
import enhanceWithClickOutside from 'react-click-outside';
import { Link } from 'react-router-dom';
import $ from 'jquery';


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
    event.preventDefault();
    var context = this;
    $.ajax({
      url: '/login',
      method: 'POST',
      success: (data) => {
        if (data) {
          console.log('sign in', data);
          data = JSON.parse(data);
          context.props.setUser(data);

        } else {
          console.log('error', data);
        }
      },
      data: {
        username: context.state.username,
        password: context.state.password,
      }

    })
    //  const currentState = this.state.active;
    //  this.setState({ active: !currentState });
  }

  // handleSignin() {
  //   console.log(this.state.username)
  // }

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
            <img src="https://i.pinimg.com/originals/24/99/03/249903173ee16b3346ba320a24e56a8b.jpg" alt="Avatar" className="avatar" />
          </div>
          <div className="container">
            <b>Username</b>
            <input
              id="username"
              type="text"
              onChange={this.changeHandler}
              placeholder="Enter Username"
              name="uname"
              required
            />
            <b>Password</b>
            <input
              id="password"
              type="password"
              onChange={this.changeHandler}
              placeholder="Enter Password"
              name="psw"
              required
            />
            <button type="submit" onClick={this.clickHandler}>Login</button>
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
