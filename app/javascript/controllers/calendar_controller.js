import { Calendar } from '@fullcalendar/core'
import dayGridPlugin from '@fullcalendar/daygrid'
import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  connect() {
    const calendarEl = document.getElementById('calendar')
    const calendar = new Calendar(calendarEl, {
      plugins: [
        dayGridPlugin
        // any other plugins
      ],
      initialView: 'dayGridMonth',
      firstDay: 1,
      // get data from event model
      events: '/events.json'
    })

    calendar.render()
  }
}