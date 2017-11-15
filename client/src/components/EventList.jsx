import React from 'react';
import EventItem from './EventItem.jsx';

const EventList = (props) => (
	<div>
    <h4>Event List</h4>
    There are { props.events.length } events.
    { props.events.map(event => <EventItem event={event} />) }
	</div>
)

export default EventList;