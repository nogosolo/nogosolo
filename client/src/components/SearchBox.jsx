import React from 'react';
import $ from 'jquery';

class Search extends React.Component {
  constructor(props) {
    super(props);
    this.handleChange = this.handleChange.bind(this);
    this.handleClick = this.handleClick.bind(this);
    this.state = {
      keyword: '',
      results: [],
    };
  }

  handleChange(e) {
    this.setState({
      keyword: e.target.value,
    });
  }

  handleClick() {
    $.ajax({
      type: 'GET',
      datatype: 'json',
      url: `https://app.ticketmaster.com/discovery/v2/events.json?apikey=yGpWxZKlGoITHFBV1OXbAoiAL6skfN20&keyword=${this.state.keyword}`,
      success: (data) => {
        console.log('data', data);
        const eventNames = data._embedded.events.map(event => event.name);
        this.setState({
          results: eventNames,
        });
      },
    });
  }

  render() {

    return (
      <div>
        <input
          type="text"
          value={this.props.keyword}
          onChange={this.handleChange}
          placerholder="Seach for an Event"/>
        <button onClick={this.handleClick}>search</button>
        <h3>Search Results for: {this.state.keyword} </h3>
        There Are {this.state.results.length} event results.
        {this.state.results.map((eventNames) => {
          return <li>{eventNames}</li>
        })}
      </div>
    );
  }
}

export default Search;
