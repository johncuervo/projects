import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["clientSelect", "weekSelect", "scheduleContainer", "startDate", "endDate"]

  connect() {
  }

  loadSchedules() {
    const clientId = this.clientSelectTarget.value
    const weekNumber = this.weekSelectTarget.value
    const selectedOption = this.weekSelectTarget.options[this.weekSelectTarget.selectedIndex]
    const startDate = selectedOption.getAttribute('data-start-date')
    const endDate = selectedOption.getAttribute('data-end-date')

    this.startDateTarget.value = startDate
    this.endDateTarget.value = endDate

    if (clientId && weekNumber && startDate && endDate) {
      fetch(`/client_schedules/load_schedules?schedule[client_id]=${clientId}&schedule[week_number]=${weekNumber}&schedule[start_date]=${startDate}&schedule[end_date]=${endDate}`, {
        headers: {
          'X-CSRF-Token': this.csrfToken()
        }
      })
      .then(response => response.text())
      .then(html => {
        this.scheduleContainerTarget.innerHTML = html
      })
      .catch(error => console.error('Error loading schedules:', error))
    }
  }

  csrfToken() {
    return document.querySelector('meta[name="csrf-token"]').getAttribute('content')
  }
}
