import L from "leaflet";

class IncidentMap {
  constructor(element, center, markerClickedCallback) {
    this.map = L.map(element).setView(center, 13);

    const accessToken = "your-access-token-goes-here";

    L.tileLayer(
      "https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}",
      {
        attribution:
          'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
        maxZoom: 18,
        id: "mapbox/streets-v11",
        tileSize: 512,
        zoomOffset: -1,
        accessToken: accessToken,
      }
    ).addTo(this.map);

    this.markerClickedCallback = markerClickedCallback;
  }

  addMarker(incident) {
    const marker =
      L.marker([incident.lat, incident.lng], { incidentId: incident.id })
        .addTo(this.map)
        .bindPopup(incident.description)

    marker.on("click", e => {
      marker.openPopup();
      this.markerClickedCallback(e);
    });

    return marker;
  }

  highlightMarker(incident) {
    const marker = this.markerForIncident(incident);

    marker.openPopup();

    this.map.panTo(marker.getLatLng());
  }

  markerForIncident(incident) {
    let markerLayer;
    this.map.eachLayer(layer => {
      if (layer instanceof L.Marker) {
        const markerPosition = layer.getLatLng();
        if (markerPosition.lat === incident.lat &&
          markerPosition.lng === incident.lng) {
          markerLayer = layer;
        }
      }
    });

    return markerLayer;
  }
}

export default IncidentMap;
