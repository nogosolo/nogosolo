import React from 'react';
import $ from 'jquery';

class MatchPage extends React.Component {
  constructor(props) {
    super(props);
    this.clickHandler = this.clickHandler.bind(this);
    this.state = {
      name: '',
      event: '',
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
        console.log(resp);
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
      <div>
        <img src={this.state.picture} alt="not found" />
        <button id={1} onClick={this.clickHandler}>Match</button>
        <button id={0} onClick={this.clickHandler}>No Match</button>
        Name: <li>{this.state.name}</li>
        Bio: <li>{this.state.bio}</li>
        Events:
        <ul>
          {this.state.events.map(event => (<li>{event}</li>))}
        </ul>
      </div>
    );
  }
}

export default MatchPage;
