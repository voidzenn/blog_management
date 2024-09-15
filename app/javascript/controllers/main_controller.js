import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["mainContainer"]

  connect(){
    window.addEventListener('scroll', this.checkScroll.bind(this));
  }

  checkScroll() {
    const scrollTop = document.documentElement.scrollTop;
    const scrollY = document.documentElement.clientHeight
    const docHeight = document.documentElement.scrollHeight

    if (scrollTop + scrollY >= docHeight) {
      // add request here
    }
  }
}
