import React from 'react';

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
    if (this.state.password === this.state.confirmPassword) {
      alert('Your Passwords don\'t Match!');
    } else {
      console.log(this.state);
    // AJAX POST REQUEST GOES HERE
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
          <input id="name" type="text" placeholder="Enter Your Name" name="username" required />

          <b>Username</b>
          <input id="username" type="text" placeholder="Enter Username" name="username" required />

          <b>Password</b>
          <input id="password" type="password" placeholder="Enter Password" name="psw" required />

          <b>Repeat Password</b>
          <input
            id="confirmPassword"
            type="password"
            placeholder="RepeatPassword"
            name="psw-repeat"
            required
          />

          <b> Profile Picture Url</b>
          <input id="picture" type="text" placeholder="Enter Picture Url" name="picture" required />

          <b>Bio</b>
          <input
            id="bio"
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
