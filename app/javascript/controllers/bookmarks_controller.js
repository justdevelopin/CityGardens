import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="bookmarks"
export default class extends Controller {
  connect() {
  }

  favourited(e) {
    e.preventDefault();
    const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
    console.log(e.currentTarget);
    const gardenId = e.currentTarget.dataset.gardenid

    fetch(`bookmarks?garden_id=${gardenId}`, {
      method: "POST",
      headers: {"Accept": "application/json", "X-CSRF-Token":token, "Content-Type": "application/json"}
    }).then(response => response.json())
    .then((data) => {
      this.element.outerHTML = data.inserted_item
    })
  }

  deleteFavourited(e) {
    e.preventDefault()
    const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
    const favouriteButton = e.currentTarget
    const gardenId = favouriteButton.dataset.gardenid
    const requestInfo = {
      method: "DELETE",
      headers: { "Accept": "application/json", 'X-CSRF-Token': token, "Content-Type": "application/json" }
    }

    fetch(`/bookmarks/${gardenId}`, requestInfo)
      .then(response => response.json())
      .then((data) => {
        this.element.outerHTML = data.inserted_item
      })
  }
}
