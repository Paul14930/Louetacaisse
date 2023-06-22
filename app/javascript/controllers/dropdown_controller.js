import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dropdown"
export default class extends Controller {
  static targets = ["avatar","michel"]
  connect() {console.log("hello");
  }
  hide () {
    this.michelTarget.classList.toggle("d-none")

  }

}
