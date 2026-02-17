<section class="bg-slate-50 px-4 py-12 sm:px-6 lg:px-8">
  <div class="mx-auto w-full max-w-6xl">
    <div class="flex flex-col gap-4">
      <p class="text-xs font-semibold uppercase tracking-[0.24em] text-slate-500">Locations</p>
      <h1 class="text-3xl font-semibold text-slate-900 sm:text-4xl">Find a location near you</h1>
      <p class="max-w-2xl text-base text-slate-600">Explore nearby conferences and communities offering support, resources, and companionship.</p>
    </div>

    <div class="mt-8 overflow-hidden rounded-2xl border border-slate-200 bg-white shadow-sm">
      <div class="flex items-center justify-between border-b border-slate-200 px-5 py-4">
        <div>
          <p class="text-xs font-semibold uppercase tracking-[0.2em] text-slate-500">Map</p>
          <p class="mt-1 text-sm text-slate-600">Location pins are generated from addresses.</p>
        </div>
        <div class="flex items-center gap-2">
          <label for="state-filter" class="text-xs font-semibold uppercase tracking-[0.2em] text-slate-400">State</label>
          <select
            id="state-filter"
            class="rounded-full border border-slate-200 bg-white px-3 py-1 text-xs font-semibold text-slate-600 shadow-sm transition focus:border-brand focus:outline-none focus:ring-2 focus:ring-brand/20"
          >
            <option value="">All</option>
            <option value="IL">IL</option>
            <option value="MO">MO</option>
            <option value="TX">TX</option>
          </select>
        </div> 
      </div>
      <div id="locations-map" class="h-[420px] w-full"></div>
    </div> 

    <div class="mt-10 grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
      {{each locations as loc limit 20}}
        <a href="{{loc.getURL()}}" class="group block h-full">
          <article class="flex h-full flex-col overflow-hidden rounded-2xl border border-slate-200 bg-white shadow-sm transition group-hover:-translate-y-1 group-hover:shadow-lg">
            <div class="aspect-video w-full overflow-hidden bg-slate-100">
              <img
                src="{{loc.main_image.getImage()}}"
                alt="{{loc.location_name}}"
                class="h-full w-full object-cover transition group-hover:scale-[1.02]"
                loading="lazy"
              />     
            </div>
            <div class="flex h-full flex-col p-6">
              <div class="space-y-2">
                <h2 class="text-lg font-semibold text-slate-900">{{loc.location_name}}</h2>
                <p class="text-sm text-slate-600">{{loc.subtitle}}</p>
              </div>

              <div class="mt-4 space-y-1 text-sm text-slate-600">
                <p>{{loc.address}}</p>
                <p>{{loc.city}}, {{loc.state}} {{loc.zip_code}}</p>
                <p class="font-medium text-slate-700">{{loc.phone}}</p>
                <p class="text-xs text-slate-500">{{loc.hours}}</p>
              </div>

              <div class="mt-6 border-t border-slate-200 pt-4 text-sm text-slate-600">
                <span class="font-semibold text-slate-700">Services:</span>
               {{ each {loc.services_offered} as serv }} <span>{{serv.title}}{{serv._arraycomma}} </span> {{/each}}
              </div>
            </div>
          </article>
        </a>
      {{/each}}
    </div>
  </div>
</section>

<link
  rel="stylesheet"
  href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css"
  integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY="
  crossorigin=""
/>
<script
  src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"
  integrity="sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo="
  crossorigin=""
  defer
></script>
{{$state = IL}}
{{if {request.queryParam(state)} }}
{{$state = {request.queryParam(state)} }}
{{/if}}
<script>
  window.addEventListener("load", () => {
    if (!window.L) {
      console.warn("Leaflet failed to load.");
      return;
    }
    const stateFilter = document.getElementById("state-filter");
    if (stateFilter) {
      const params = new URLSearchParams(window.location.search);
      const currentState = params.get("state") || "";
      stateFilter.value = currentState;
      stateFilter.addEventListener("change", (event) => {
        const value = event.target.value;
        const nextParams = new URLSearchParams(window.location.search);
        if (value) {
          nextParams.set("state", value);
        } else {
          nextParams.delete("state");
        }
        const query = nextParams.toString();
        window.location = query ? `${window.location.pathname}?${query}` : window.location.pathname;
      });
    }

    const locationData = [
    {{each locations as loc where loc.state like '{$state}' limit 100}}
        {
          name: "{{loc.location_name}}",
          subtitle: "{{loc.subtitle}}",
          address: "{{loc.address}}",
          city: "{{loc.city}}",
          state: "{{loc.state}}",
          zip: "{{loc.zip_code}}",
          url: "{{loc.getURL()}}"
        }{{loc._arraycomma}}
    {{/each}}
    ];

    const map = L.map("locations-map", {
      scrollWheelZoom: false,
      attributionControl: true
    }).setView([39.5, -98.35], 4);

    L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
      maxZoom: 18,
      attribution: "&copy; OpenStreetMap contributors"
    }).addTo(map);

    const bounds = L.latLngBounds([]);

    const geocodeLocation = async (loc) => {
      const query = encodeURIComponent(`${loc.address}, ${loc.city}, ${loc.state} ${loc.zip}`);
      const url = `https://nominatim.openstreetmap.org/search?format=json&limit=1&q=${query}`;
      try {
        const response = await fetch(url, { headers: { "Accept-Language": "en" } });
        const data = await response.json();
        if (!data.length) return;
        const { lat, lon } = data[0];
        const marker = L.marker([lat, lon]).addTo(map);
        marker.bindPopup(
          `<div class="space-y-1">
            <div class="text-sm font-semibold">${loc.name}</div>
            <div class="text-xs text-slate-600">${loc.address}, ${loc.city}, ${loc.state} ${loc.zip}</div>
            <a class="text-xs font-semibold text-blue-600" href="${loc.url}">View details</a>
          </div>`
        );
        bounds.extend([lat, lon]);
        if (bounds.isValid()) {
          map.fitBounds(bounds.pad(0.2));
        }
      } catch (error) {
        console.warn("Geocode failed", loc, error);
      }
    };

    locationData.forEach((loc) => {
      geocodeLocation(loc);
    });
  });
</script>
