import React from 'react';
// import Slider from 'react-image-slider';
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
    };
  }


  componentDidMount() {
    $.ajax({
      type: 'GET',
      url: '/match/hackerpirate', // Replace hackerpirate with username of signed in user
      success: (resp) => {
        console.log(resp);
        this.setState(resp);
      },
    });
  }

  // clickHandler(event) {
  //   console.log(event.target.id)
  // }

  render() {
    return (
      <div>
        {/* <Slider images={this.state.pictures} isInfinite delay={5000}>
          {images.map((image, key) => <div key={key}><img src={image} /></div>)}
        </Slider> */}
        <img src={this.state.picture} alt="not found" />
        <button id="yes" onClick={this.clickHandler}>Match</button>
        <button id="no" onClick={this.clickHandler}>No Match</button>
        Name: <li>{this.state.name}</li>
        Event: <li>{this.state.event}</li>
        Bio: <li>{this.state.bio}</li>
      </div>
    );
  }
}

export default MatchPage;
