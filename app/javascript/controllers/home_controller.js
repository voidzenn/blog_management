import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "input"]

  connect() {
    // this.fetchPosts();
    // console.log("test")
  }

  search(event) {
    event.preventDefault();

    const form = this.formTarget
    form.requestSubmit()
  }

  fetchPosts(query = "") {
    fetch(`/home/search?query=${query}`, {
      headers: { accept: 'text/vnd.turbo-stream.html' },
    })
    .then((response) => response.text())
    .then((html) => {
      console.log(html)
      const turboFrame = document.getElementById('posts')

      if (html !== '[]' && turboFrame) {
        turboFrame.outerHTML = html
      }
    });
  }
}
