import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "button", "posts"]

  search() {
    const query = this.inputTarget.value

    fetch(`/posts/search?query=${query}`)
      .then(response => {
        return response.json()
      })
      .then(data => {
        console.log(data.map(post => post._source.title))
        this.postsTarget.innerHTML = data
          .map((post) => `<div>${post._source.title}</div>`)
          .join('');
      })
  }
}
