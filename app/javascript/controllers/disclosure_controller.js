import { Controller } from "@hotwired/stimulus"

// Toggles a collapsible sidebar submenu (parent/child menu items).
export default class extends Controller {
  static targets = ["panel", "icon"]

  toggle() {
    this.panelTarget.classList.toggle("hidden")
    this.iconTarget.classList.toggle("rotate-90")
  }
}
