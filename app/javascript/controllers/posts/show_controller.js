import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
  }

  back() {
    fetch("/posts")
    .then(response => response.text())
    .then(html => {
      const element = document.getElementById('main-container')

      if (html !== '[]' && element) {
        element.innerHTML = html
      }

      history.replaceState(null, '', '/posts')
    })
  }
}
