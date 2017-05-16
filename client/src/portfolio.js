import React, { Component } from 'react'
import { Container, Header, Segment, Button, Icon, Dimmer, Loader, Divider } from 'semantic-ui-react'

class Portfolio extends React.Component {
  render() {
    return <h1>Hello, {this.props.name}</h1>;
  }
}

export default Portfolio