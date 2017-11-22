import React from 'react';

const EventItem = (props) => (
  <div>
    <ul>
      <li>{ props.event.name }</li>
    </ul>
  </div>
)

export default EventItem;