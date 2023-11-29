import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["list", "map"]

  connect() {
  }

  toggleEventsList() {
    console.log(this.listTarget, this.mapTarget)
    const list = this.listTarget;
    console.log()
    if (list.classList.contains("d-none")) {
    list.classList.remove("d-none")
    } else {
      list.classList.add("d-none")
    }
  }
}
