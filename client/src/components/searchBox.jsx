import React from 'react';
import { Link } from 'react-router-dom';

class SearchBox extends React.Component {
  constructor(props) {
    super(props);
    this.changeHandler = this.changeHandler.bind(this);
    this.clickHandler = this.clickHandler.bind(this);
    this.state = {
      keyword: '',
    };
  }

  changeHandler(event) {
    this.setState({
      keyword: event.target.value,
    });
  }

  clickHandler() {
    this.props.searchHandler(this.state.keyword);
  }

  render() {
    return (
      <div>
        <input type="text" value={this.state.keyword} onChange={this.changeHandler} />
        <Link onClick={this.clickHandler} to="/search">Search</Link>
      </div>
    );
  }
}

export default SearchBox;
