import React from 'react';
import Slider from 'react-image-slider';

class MatchPage extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      username: '',
      event: '',
      bio: '',
      pictures: []
    }
  }

  render() {
    return(
      <div>
        <Slider images={this.state.pictures} isInfinite delay={5000}>
          {images.map((image, key) => <div key={key}><img src={image} /></div>)}
        </Slider>
        <button onClick={}>Match</button>
        Name: <li>{this.state.username}</li>
        Event: <li>{this.state.event}</li>
        Bio: <li>{this.state.bio}</li>
      </div>
    )
  }

}
export default MatchPage;