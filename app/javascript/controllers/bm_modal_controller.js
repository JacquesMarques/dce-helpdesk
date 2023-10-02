import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="bm-modal"
export default class extends Controller {
  connect() {
    console.log('is-active')
    this.element.classList.add('is-active')
  }

  close(event) {
    console.log('remove is-active')
    this.element.classList.remove('is-active')
  }

  submitEnd(envent) {
    this.element.classList.remove('is-active')
  }
}
