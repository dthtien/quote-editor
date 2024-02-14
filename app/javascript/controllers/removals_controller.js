import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="removals"
export default class extends Controller {
  connect() {
    console.log("Hello, removals!")
  }
  remove() {
    this.element.remove()
  }
}
