import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["list", "map", "toggleButton"]

  connect() {
    this.updateToggleButtonLabel();
  }

  toggleEventsList() {
    this.mapTarget.classList.toggle("hidden");
    this.listTarget.classList.toggle("d-none");
    this.updateToggleButtonLabel();
  }

  updateToggleButtonLabel() {
    const listIsVisible = !this.listTarget.classList.contains('d-none');
    this.toggleButtonTarget.textContent = listIsVisible ? 'Map' : 'List';
  }
}
