import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  static targets = ["infoPanel", "eventsList"]

  connect() {
    mapboxgl.accessToken = this.apiKeyValue
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })

    this.addMarkersToMap()
    this.fitMapToMarkers()
  }

  addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const markerElement = new mapboxgl.Marker()
        .setLngLat([marker.lng, marker.lat])
        .addTo(this.map);

      markerElement.getElement().addEventListener('click', (e) => {
        this.showInfoPanel(marker);
      });
    });
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
  }

  closeInfoPanel() {
    this.infoPanelTarget.classList.add('hidden');
  }

  fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([marker.lng, marker.lat]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }

  toggleEventsList() {
    const list = this.eventsListTarget;
    if (list.style.display === "none") {
      list.style.display = "block";
      this.map.resize();
    } else {
      list.style.display = "none";
    }
  }
}
