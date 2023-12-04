import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  static targets = ["infoPanel"]

  connect() {
    mapboxgl.accessToken = this.apiKeyValue
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/adrewkin/ckw0ygjis9a9h14ujewnkojkm"
    })

    this.currentMarkers = [];
    this.addMarkersToMap()
    this.fitMapToMarkers()
  }

  addMarkersToMap() {

    this.currentMarkers.forEach(marker => marker.remove())
    this.currentMarkers = []

    this.markersValue.forEach((markerData) => {
      const popup = new mapboxgl.Popup({ className: "fixed-popup", maxWidth: "none", anchor: "bottom" })
        .setHTML(markerData.infoWindow)

      const marker = new mapboxgl.Marker()
        .setLngLat([markerData.lng, markerData.lat])
        .setPopup(popup)
        .addTo(this.map)

      this.currentMarkers.push(marker)
    })
  }

  showInfoPanel(marker) {
    const infoPanelHtml = `
      <div>
        <h2>${marker.name}</h2>
        <p>${marker.description}</p>
        <p>Date: ${marker.date}</p>
        <p>Location: ${marker.location}</p>
      </div>`;

    this.infoPanelTarget.innerHTML = infoPanelHtml;
    this.infoPanelTarget.classList.remove('hidden');
    this.infoPanelTarget.classList.add('open');
  }

  closeInfoPanel() {
    this.infoPanelTarget.classList.add('hidden');
  }

  fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([marker.lng, marker.lat]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }

  updateMapMarkers(event) {
    event.preventDefault()

    const query = new FormData(event.target).get('query')
    const url = `${this.data.get("url")}?query=${query}`

    fetch(url, {
      headers: { Accept: 'application/json' }
    })
      .then(response => response.json())
      .then(data => this.updateMarkersOnMap(data))
      .catch(error => console.error("Error fetching markers:", error))
  }

  updateMarkersOnMap(data) {
    this.markersValue = data
    this.addMarkersToMap()
    this.fitMapToMarkers()
  }

}
