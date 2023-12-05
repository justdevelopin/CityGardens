import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-garden"
export default class extends Controller {
  static targets = ["form"];

  connect() {
  }

  submit() {
    Rails.fire(this.formTarget, 'submit');
  }
}
