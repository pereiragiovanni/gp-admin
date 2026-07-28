import { Controller } from "@hotwired/stimulus"

// Toggles a password field between hidden (•••) and plain text.
export default class extends Controller {
  static targets = ["input", "showIcon", "hideIcon"]

  toggle() {
    const showing = this.inputTarget.type === "text"
    this.inputTarget.type = showing ? "password" : "text"
    this.showIconTarget.classList.toggle("hidden")
    this.hideIconTarget.classList.toggle("hidden")
  }
}
