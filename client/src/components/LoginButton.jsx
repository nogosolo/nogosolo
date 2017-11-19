import React from 'react';

const LoginButton = function (props) {
  return (
    <button onClick={props.triggerLogin}>Login</button>
  );
};

export default LoginButton;
