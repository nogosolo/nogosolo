import React from 'react';
import $ from 'jquery';


class EventPage extends React.Component {
  constructor(props) {
    super(props);
    this.clickHandler = this.clickHandler.bind(this);
    this.state = {
      attending: false,
    };
  }


  componentDidMount() {
    $.ajax({
      type: 'GET',
      url: `/event/${this.props.event.id}/${this.props.userId}`,
      success: (resp) => {
        this.setState({ attending: resp });
      },
    });
  }

  clickHandler(event) {
    $.ajax({
      type: 'POST',
      url: '/event',
      data: {
        userId: this.props.userId,
        eventId: this.props.event.id,
      },
      success: (resp) => {
        console.log(resp);
        this.setState({ attending: true });
      },
    });
  }

  render() {
    return (
      <div>
        <h1> {this.props.event.name} </h1>
        <li>{this.props.event._embedded.venues['0'].address.line1}</li>
        <li>{this.props.event._embedded.venues['0'].city.name}</li>
        <li>{this.props.event._embedded.venues['0'].country.countryCode}</li>
        <img src={this.props.event.images['8'].url} alt="not found" />
        {!this.state.attending && (<button onClick={this.clickHandler}>Click to Attending</button>)}
        {this.state.attending && (<button disabled >Attending</button>)}
      </div>
    );
  }
}

export default EventPage;
