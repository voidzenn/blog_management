import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["postClick"]

  connect() {
  }

  handle_click(event) {
    const slug = event.currentTarget.dataset.slug

    fetch(`/posts/${slug}`)
      .then((response) => response.text())
      .then((html) => {
        const element = document.getElementById('posts_index')

        if (html !== '[]' && element) {
          element.innerHTML = html
        }

        history.pushState(null, '', `/posts/${slug}`)
      });
  }
}
