import { Controller } from "@hotwired/stimulus"

// Uploads the file as soon as the visitor picks it. The upload uses
// XMLHttpRequest because fetch cannot report upload progress.
export default class extends Controller {
  static targets = [ "input", "progress" ]
  static values = { maxSize: Number, tooBigMessage: String }

  submit() {
    const file = this.inputTarget.files[0]
    if (!file) return

    if (file.size > this.maxSizeValue) {
      this.#refuse()
      return
    }

    const request = new XMLHttpRequest()
    request.open("POST", this.element.action)
    request.setRequestHeader("Accept", "text/html")
    request.upload.addEventListener("progress", (event) => this.#showProgress(event))
    request.addEventListener("loadend", () => this.#finish(request))

    this.progressTarget.hidden = false
    request.send(new FormData(this.element))
  }

  #showProgress(event) {
    if (event.lengthComputable) {
      this.progressTarget.max = event.total
      this.progressTarget.value = event.loaded
    }
  }

  #finish(request) {
    this.progressTarget.hidden = true

    if (request.status >= 200 && request.status < 300) {
      Turbo.visit(window.location.href, { action: "replace" })
    } else {
      this.#refuse()
    }
  }

  #refuse() {
    alert(this.tooBigMessageValue)
    this.inputTarget.value = ""
  }
}
