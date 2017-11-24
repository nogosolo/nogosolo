import React from 'react';
import $ from 'jquery';
import apiKey from '../../../config';


class Search extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      results: [],
    };
  }


  componentDidMount() {
    $.ajax({
      type: 'GET',
      datatype: 'json',
      url: `https://app.ticketmaster.com/discovery/v2/events.json?apikey=${apiKey}&keyword=${this.props.searchQuery}`,
      success: (data) => {
        const events = data._embedded.events;
        window.x = data; // just to look at stuff in chrome
        this.setState({
          results: events,
        });
      },
    });
  }

  componentDidUpdate() {
    this.componentDidMount();
  }

  render() {
    if (!this.state.results.length) {
      return (<div><b>There were no results for: {this.props.searchQuery}</b></div>);
    } else {
      return (
          <div>
            <h3>Search Results for: {this.state.keyword} </h3>
            There Are {this.state.results.length} event results.
            {this.state.results.map((event) => {
              return <li>
                {event.name} {' '}
                {event.dates.start.localDate} {' '}
                {event._embedded.venues["0"].address.line1} {' '}
                {event._embedded.venues["0"].city.name} {' '}
                {event._embedded.venues["0"].country.countryCode} {' '}
              </li>; })}
          </div>
      );
    }
  }
}

export default Search;
