import React from 'react';

const LoginButton = function (props) {
  return (
    <a onClick={props.triggerLogin}>Login</a>
  );
};

export default LoginButton;
