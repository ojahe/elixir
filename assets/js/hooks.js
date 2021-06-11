import LineChart from "./line-chart"
import IncidentMap from "./incident-map"

let Hooks = {};

Hooks.IncidentMap = {
  mounted() {
    this.map = new IncidentMap(this.el, [39.74, -104.99], event => {
      const incidentId = event.target.options.incidentId;

      this.pushEvent("marker-clicked", incidentId, (reply, ref) => {
        this.scrollTo(reply.incident.id)
      })
    })

    this.pushEvent("get-incidents", {}, (reply, ref) => {
      reply.incidents.forEach(incident => {
        this.map.addMarker(incident)
      })
    })

    // const incidents = JSON.parse(this.el.dataset.incidents);

    // incidents.forEach(incident => {
    //   this.map.addMarker(incident);
    // })

    this.handleEvent("highlight-marker", incident => {
      this.map.highlightMarker(incident);
    })

    this.handleEvent("add-marker", incident => {
      this.map.addMarker(incident);
      this.map.highlightMarker(incident);
      this.scrollTo(incident.id)
    })
  },

  scrollTo(incidentId) {
    const incidentElement =
      document.querySelector(`[phx-value-id="${incidentId}"]`);

    incidentElement.scrollIntoView(false);
  }
}

Hooks.LineChart = {
  mounted() {
    const { labels, values } = JSON.parse(this.el.dataset.chartData)
    this.chart = new LineChart(this.el, labels, values)

    this.handleEvent("new-point", ({ label, value }) => {
      this.chart.addPoint(label, value)
    })
  }
}

Hooks.InfiniteScroll = {
  mounted() {
    console.log("Footer added to DOM!", this.el);
    this.observer = new IntersectionObserver(entries => {
      const entry = entries[0];
      if (entry.isIntersecting) {
        console.log("Footer is visible!");
        this.pushEvent("load-more");
      }
    });

    this.observer.observe(this.el);
  },
  updated() {
    const pageNumber = this.el.dataset.pageNumber;
    console.log("updated", pageNumber);
  },
  destroyed() {
    this.observer.disconnect();
  },
};

export default Hooks;
