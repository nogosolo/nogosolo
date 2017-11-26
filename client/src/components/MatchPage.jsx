import React from 'react';
import $ from 'jquery';

class MatchPage extends React.Component {
  constructor(props) {
    super(props);
    this.clickHandler = this.clickHandler.bind(this);
    this.state = {
      name: '',
      bio: '',
      picture: '',
      matchId: 0,
      events: [],
    };
  }


  componentDidMount() {
    $.ajax({
      type: 'GET',
      url: `/match/${this.props.userId}`,
      success: (resp) => {
        this.setState(resp);
      },
    });
  }

  clickHandler(event) {
    $.ajax({
      type: 'POST',
      url: '/match',
      data: {
        userId: this.props.userId,
        matchId: this.state.matchId,
        matchStatus: event.target.id,
      },
      success: (resp) => {
        console.log(resp);
        this.componentDidMount();
      },
    });
  }

  render() {
    return (
      <div className="slideshow-container">
        <div className="mySlides">
          <img
            className="matchimg"
            src={this.state.picture}
            width="450"
            height="450"
            alt="not found"
          />
          <br />
          <button id={1} onClick={this.clickHandler}>Match</button>
          <button id={0} onClick={this.clickHandler}>No Match</button>
          <br />
          <p className="matchname"><b>Name:</b> {this.state.name}</p>
          <p className="matchbio"><b>Bio:</b> {this.state.bio}</p>
          <b>Events:</b> {this.state.events.map(event => (<li>{event}</li>))}
        </div>
      </div>
    );
  }
}

export default MatchPage;
