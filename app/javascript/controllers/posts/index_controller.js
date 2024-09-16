import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["searchposts"]

  connect() {
    window.addEventListener("scroll", this.checkScroll.bind(this))
  }

  disconnect() {
    window.removeEventListener("scroll", this.checkScroll.bind(this))
  }

  search() {
    this.searchPosts(this.searchpostsTarget.value);
  }

  checkScroll() {
    const scrollTop = document.documentElement.scrollTop
    const scrollY = document.documentElement.clientHeight
    const docHeight = document.documentElement.scrollHeight


    if (scrollTop + scrollY >= docHeight) {
      this.appendLoadingCard()
    }
  }

  appendLoadingCard() {
    fetch(`/posts/card_load`, {
      headers: { accept: 'text/vnd.turbo-stream.html' }
    })
    .then((response) => response.text())
    .then((html) => {
      Turbo.renderStreamMessage(html)
    })
  }

  searchPosts(query = "") {
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
    })
  }
}
