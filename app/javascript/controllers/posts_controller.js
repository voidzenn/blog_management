import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["searchposts"]

  search() {
    this.fetchPosts(this.searchpostsTarget.value);
  }

  fetchPosts(query = "") {
    fetch(`/posts/search?query=${query}`, {
      headers: { accept: 'text/vnd.turbo-stream.html' },
    })
    .then((response) => response.text())
    .then((html) => {
      const turboFrame = document.getElementById('posts')
      if (html !== '[]' && turboFrame) {
        turboFrame.innerHTML = ""
      }
      Turbo.renderStreamMessage(html)
    });
  }
}
