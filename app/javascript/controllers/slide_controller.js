import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="slide"
export default class extends Controller {
  static targets = ["map", "events"]

  connect() {
  }

  toggle() {
    this.mapTarget.classList.toggle('hidden')
    this.eventsTarget.classList.toggle('hidden')
  }
}
