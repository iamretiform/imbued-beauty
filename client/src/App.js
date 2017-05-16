import React, { Component } from 'react'
import { Container, Header, Segment, Button, Icon, Dimmer, Loader, Divider } from 'semantic-ui-react'

class App extends Component {
  constructor () {
    super()
    this.state = {}
    this.getAppointments = this.getAppointments.bind(this)
    this.getAppointment = this.getAppointment.bind(this)
  }
  componentDidMount () {
    this.getAppointments()
  }
  fetch (endpoint) {
    return new Promise((resolve, reject) => {
      window.fetch(endpoint)
      .then(response => response.json())
      .then(json => resolve(json))
      .catch(error => reject(error))
    })
  }
  getAppointments () {
    this.fetch('api/appointments')
      .then(appointments => {
        this.setState({appointments: appointments})
        this.getAppointment(appointments[0].id)
      })
  }
  getAppointment (id) {
    this.fetch(`api/appointments/${id}`)
      .then(appointment => this.setState({appointment: appointment}))
  }
  render () {
    let {appointments, appointment} = this.state
    return appointments
    ? <Container text>
        <Header as='h2' icon textAlign='center'>
        <Icon name='calendar' circular />
        <Header.Content>
          List of Appointments
        </Header.Content>
      </Header>
        {Object.keys(appointments).map((key) => {
          return <Button active={appointment && appointment.id === appointments[key].id} fluid key={key} onClick={() => this.getAppointment(appointments[key].id)}>
            {appointments[key].subject}
          </Button>
        })}
      <Divider hidden />
      {appointment &&
        <Container>
          <Header as='h2'>{appointment.subject}</Header>
          {appointment.date && <p>{appointment.date}</p>} 
          {appointment.start_time && <p>{appointment.start_time}</p>}
          {appointment.description && <p>{appointment.description}</p>}
          {appointment.services &&
            <Segment.Group>
              {appointment.services.map((service, i) => <Segment key={i}><h4>{service.title}</h4> {service.description}</Segment>)}
            </Segment.Group>
          }
        </Container>
      }
    </Container>
    : <Container text>
      <Dimmer active inverted>
        <Loader content='Loading' />
      </Dimmer>
    </Container>
  }
}


export default App