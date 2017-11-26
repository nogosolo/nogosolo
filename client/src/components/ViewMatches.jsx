import React from 'react';
import $ from 'jquery';

class ViewMatches extends React.Component {
  constructor(props) {
    super(props);
    this.clickHandler = this.clickHandler.bind(this);
    this.state = {
      matches: [],
    };
  }


  componentDidMount() {
    $.ajax({
      type: 'GET',
      url: `/viewMatches/${this.props.userId}`,
      success: (resp) => {
        this.setState({
          matches: resp,
        });
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
        this.componentDidMount();
      },
    });
  }

  render() {
    return (
      <div>
        <ul>
          {this.state.matches.map(match => (
            <li className="post-list-entry">
              <div className="post-list-entry-title">{match.name}</div>
              <div className="post-list-entry-byline">{match.bio}</div>
              <div className="post-list-entry-byline">
                Events: {match.events.map(event => (<span> {event} </span>))}
              </div>
            </li>
            ))}
        </ul>
      </div>
    );
  }
}

export default ViewMatches;
