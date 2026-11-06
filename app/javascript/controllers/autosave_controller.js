import { Controller } from "@hotwired/stimulus"

// Saves the text after the visitor stops typing. While a save is pending,
// page refreshes from other visitors do not overwrite the text.
export default class extends Controller {
  static targets = [ "text" ]
  static values = { delay: { type: Number, default: 800 } }

  disconnect() {
    clearTimeout(this.timeout)
  }

  queue() {
    this.pending = true
    clearTimeout(this.timeout)
    this.timeout = setTimeout(() => this.#save(), this.delayValue)
  }

  saved() {
    this.saving = false
  }

  preserveTyping(event) {
    if (event.target === this.textTarget && (this.pending || this.saving)) {
      event.preventDefault()
    }
  }

  #save() {
    this.pending = false
    this.saving = true
    this.element.requestSubmit()
  }
}
