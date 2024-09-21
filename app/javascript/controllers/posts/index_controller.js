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

    this.isLoadingCard = false

    if ((scrollTop + scrollY >= docHeight) && !this.isLoadingCard) {
      this.fetchNextPosts()
    }
  }


  fetchNextPosts() {
    const postsElement = document.querySelectorAll('#posts > .flex');
    const postsContentCount = postsElement ? postsElement.length + 1 : 0

    fetch(`/posts?page=${postsContentCount}`, {
      headers: { accepts: 'text/vnd.turbo-stream.html' }
    })
    .then((response) => response.text())
    .then((html) => {
      Turbo.renderStreamMessage(html)

      this.isLoadingCard = false
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
