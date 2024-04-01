import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="shrink-header"
export default class extends Controller {
  static targets=["header"]

  connect() {
    console.log(document);
  document.addEventListener("scroll", this.shrink);
  }

  shrink = () => {
    this.headerTarget.classList.add("small");
  }

}
