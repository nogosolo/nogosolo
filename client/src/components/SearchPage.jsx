import React from 'react';
import { Link } from 'react-router-dom';
import $ from 'jquery';
import apiKey from '../../../config';


class Search extends React.Component {
  constructor(props) {
    super(props);
    this.clickHandler = this.clickHandler.bind(this);
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

  clickHandler(event) {
    console.log(event.target.id)
    console.log('THIS.STATE.RESULTS', JSON.stringify(this.state.results, null, 2))
    this.props.eventSearchClick(this.state.results[event.target.id]);
  }

  render() {
    if (!this.state.results.length) {
      return (<div><b>There were no results for: {this.props.searchQuery}</b></div>);
    } else {
      return (
          <div>
            <h3>Search Results for: {this.state.keyword} </h3>
            There Are {this.state.results.length} event results.
            {this.state.results.map((event, index) => {
              if (event._embedded.venues["0"] && event._embedded.venues["0"].address && event._embedded.venues["0"].address.line1 &&
              event.name && event.dates.start.localDate && event._embedded.venues["0"].city &&
              event._embedded.venues["0"].city.name && event._embedded.venues["0"].country.countryCode && event.images['8'].url) {
              const eventStr = `${event.name} on ${event.dates.start.localDate}
               at ${event._embedded.venues["0"].address.line1}
               , ${event._embedded.venues["0"].city.name}
               , ${event._embedded.venues["0"].country.countryCode}`
              return <li>
                <Link id={index} onClick={this.clickHandler} to="/event">
                {eventStr}
                </Link>
              </li>; }})}
          </div>
      );
    }
  }
}

export default Search;
