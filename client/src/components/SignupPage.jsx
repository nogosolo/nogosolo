import React from 'react';
import $ from 'jquery';

class SignUpPage extends React.Component {
  constructor(props) {
    super(props);
    this.changeHandler = this.changeHandler.bind(this);
    this.clickHandler = this.clickHandler.bind(this);
    this.state = {
      username: '',
      password: '',
      confirmPassword: '',
      bio: '',
      picture: '',
      name: '',
    };
  }


  clickHandler(event) {
    event.preventDefault();
    if (this.state.password !== this.state.confirmPassword) {
      alert('Your Passwords don\'t Match!');
    } else {
      $.ajax({
        type: 'POST',
        url: '/signup',
        data: this.state,
        success: (resp) => {
          if (resp === 'Username is already taken!') {
            alert('This Username is already taken!');
          } else {
            console.log(resp);
          }
        },
        error: (resp) => {
          console.log(resp);
        },
      });
    }
  }

  changeHandler(event) {
    this.setState({
      [event.target.id]: event.target.value,
    });
  }

  render() {
    return (
      <div>
        <form>
          {/* <div className="container"> */}
          <b>Name</b>
          <input
            id="name"
            onChange={this.changeHandler}
            type="text"
            placeholder="Enter Your Name"
            name="username"
            required
          />

          <b>Username</b>
          <input
            id="username"
            onChange={this.changeHandler}
            type="text"
            placeholder="Enter Username"
            name="username"
            required
          />

          <b>Password</b>
          <input
            id="password"
            onChange={this.changeHandler}
            type="password"
            placeholder="Enter Password"
            name="psw"
            required
          />

          <b>Repeat Password</b>
          <input
            id="confirmPassword"
            onChange={this.changeHandler}
            type="password"
            placeholder="RepeatPassword"
            name="psw-repeat"
            required
          />

          <b> Profile Picture Url</b>
          <input
            id="picture"
            onChange={this.changeHandler}
            type="text"
            placeholder="Enter Picture Url"
            name="picture"
            required
          />

          <b>Bio</b>
          <input
            id="bio"
            onChange={this.changeHandler}
            type="text"
            placeholder="Write a Short Bio About Yourself"
            maxLength="255"
            name="bio"
            required
          />

          {/* <input type="checkbox" checked="checked" /> Remember me */}
          {/* <p>By creating an account you agree to our <a href="#">Terms & Privacy</a>.</p> */}

          <div className="clearfix">
            <button type="submit" onClick={this.clickHandler} className="signupbtn">Sign Up</button>
          </div>
          {/* </div> */}
        </form>
      </div>
    );
  }
}

export default SignUpPage;
