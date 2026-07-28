import { Controller } from "@hotwired/stimulus"

// Shows the picked file in the avatar <img> right away, before the form is submitted.
export default class extends Controller {
  static targets = ["input", "preview"]

  change() {
    const file = this.inputTarget.files[0]
    if (!file) return

    const reader = new FileReader()
    reader.onload = () => { this.previewTarget.src = reader.result }
    reader.readAsDataURL(file)
  }
}
