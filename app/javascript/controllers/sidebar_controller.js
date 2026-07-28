import { Controller } from "@hotwired/stimulus"

// Collapses the sidebar down to icon-only, remembering the choice across page visits.
// Visibility of labels/submenus is handled purely via CSS (group-data-[collapsed]),
// this controller only flips the `data-collapsed` attribute and the width class.
export default class extends Controller {
  connect() {
    if (localStorage.getItem("sidebar:collapsed") === "true") this.collapse()
  }

  toggle() {
    this.element.dataset.collapsed === "true" ? this.expand() : this.collapse()
  }

  collapse() {
    this.element.classList.replace("w-64", "w-16")
    this.element.dataset.collapsed = "true"
    localStorage.setItem("sidebar:collapsed", "true")
  }

  expand() {
    this.element.classList.replace("w-16", "w-64")
    this.element.dataset.collapsed = "false"
    localStorage.setItem("sidebar:collapsed", "false")
  }
}
